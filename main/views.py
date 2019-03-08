from django.views.generic.edit import CreateView, UpdateView, DeleteView,\
    FormView
from main.models import Image, Dataset, DatasetImage, Output, Product
from django.views.generic.list import ListView
from main.tables import ImageTable, DatasetTable, DatasetImageTable,\
    ImageRemainingTable, OutputTable,\
    PhotoColumn, ProductTable
from django.urls.base import reverse_lazy, reverse
from django.views.generic.base import View, TemplateView
from django.shortcuts import redirect, render
from CrackDetection.settings import BASE_DIR
from django.http.response import HttpResponse
from main.forms import AlgorithmForm
import requests
from django.contrib.auth.mixins import LoginRequiredMixin
            
class ImageViews_base:
    model = Image
    fields = ['name', 'data']
    headertext='Create & Edit Images'

class ImageViews(LoginRequiredMixin, ImageViews_base):
    model = Image

class ImageCreate(ImageViews, CreateView):
    template_name = 'create.html'
    success_url = reverse_lazy('image-list')
    subheadertext='New Image:'

class ImageList(ImageViews_base, ListView):
    template_name = 'list.html'
    subheadertext='Images:'
    def get_context_data(self, **kwargs):
        context = super(ImageList, self).get_context_data(**kwargs)
        context['addurl'] = 'image-create'
        context['table'] = ImageTable(Image.objects.all())
        return context

class ImageUpdate(ImageViews, UpdateView):
    template_name = 'create.html'
    success_url = reverse_lazy('image-list')
    subheadertext='Edit Image:'

class ImageDelete(ImageViews, DeleteView ):
    template_name = 'delete.html'
    success_url = reverse_lazy('image-list')
    subheadertext='Delete Image:'

class DatasetViews_base:
    model = Dataset
    fields = ['name', 'description']
    headertext='Create & Edit Datasets'
    
class DatasetViews(LoginRequiredMixin, DatasetViews_base):
    model = Dataset
     
class DatasetCreate(DatasetViews, CreateView):
    template_name = 'create.html'
    success_url = reverse_lazy('dataset-list')
    subheadertext='New Dataset:'

class DatasetList(DatasetViews_base, ListView):
    template_name = 'list.html'
    subheadertext='Datasets:'
    def get_context_data(self, **kwargs):
        context = super(DatasetList, self).get_context_data(**kwargs)
        context['addurl'] = 'dataset-create'
        context['table'] = DatasetTable(Dataset.objects.all())
        return context

class DatasetUpdate(DatasetViews, UpdateView):
    template_name = 'create.html'
    success_url = reverse_lazy('dataset-list')
    subheadertext='Edit Dataset:'
    def get_context_data(self, **kwargs):
        context = super(DatasetUpdate, self).get_context_data(**kwargs)
        datasetimages = DatasetImage.objects.filter(dataset_id=self.kwargs['pk'])
        context['table'] = DatasetImageTable(datasetimages)
        return context

class DatasetDelete(DatasetViews, DeleteView):
    template_name = 'delete.html'
    subheadertext='Delete Dataset:'
    success_url = reverse_lazy('dataset-list')

class DatasetAddImage(DatasetViews, ListView):
    model = Image
    template_name = 'list.html'
    subheadertext='Add Image to Dataset:'
    
    def get_context_data(self, **kwargs):
        context = super(DatasetAddImage, self).get_context_data(**kwargs)
        dsimages = DatasetImage.objects.filter(dataset_id=self.kwargs['pk'])
        dsimage_ids = dsimages.values_list('image__id', flat=True) 
        images = Image.objects.all().exclude(id__in=dsimage_ids)
        context['table'] = ImageRemainingTable(images)
        return context
    
class DatasetImageCreate(View):
    def get(self, request, *args, **kwargs):
        dataset = Dataset.objects.get(id=kwargs['dsid'])
        image = Image.objects.get(id=kwargs['imid'])
        datasetimage = DatasetImage.objects.create(dataset=dataset, image=image)
        datasetimage.save()
        return redirect(reverse('dataset-update', args=[kwargs['dsid']]))
    
class DatasetImageDelete(View):
    def get(self, request, *args, **kwargs):
        dsid = kwargs['dsid']
        imid = kwargs['imid']
        datasetimage = DatasetImage.objects.get(dataset_id=dsid, image_id=imid)
        datasetimage.delete()
        return redirect(reverse('dataset-update', args=[dsid]))   
    
class CalculationsViews:
    headertext='Calculations'
    
class DatasetCalculateView(CalculationsViews, FormView):
    form_class = AlgorithmForm
    template_name = 'create.html'
    subheadertext='Run algorithm for the dataset:'
    
    def save_output(self, algorithm, output):
        output.save()
        uri = reverse(algorithm, args=[output.id])
        url = self.request.build_absolute_uri(uri)
        requests.get(url)
        
    def form_valid(self, form):
        dsimages = DatasetImage.objects.filter(dataset_id=form.data['dataset'])
        algorithms = form.cleaned_data['algorithm']
        
        outputs=[]
        for dsimage in dsimages:
            row={}
            row['input']=dsimage.image
            for algorithm in algorithms:
                row[algorithm]=Output.objects.get_or_create(
                    algorithm=algorithm, image=dsimage.image)[0]
                self.save_output(algorithm, row[algorithm])
            outputs.append(row)
 
        extra_columns=[]
        for algorithm in algorithms:
            col=PhotoColumn('output-view', 'record.'+algorithm+'.pk', True)
            extra_column=(algorithm, col)
            extra_columns.append(extra_column)
        table=OutputTable(outputs, extra_columns=extra_columns)
        return render(self.request, 'list.html', {
                'table': table,
                'view': {
                    'headertext': 'Calculations',
                    'subheadertext': 'Comparing Algorithms:',
                }
            })

class PhotoView(TemplateView):
    template_name='view.html'
    
class ImageView(View):
    def get(self, request, *args, **kwargs):
        image_id=kwargs['pk']
        image=Image.objects.get(id=image_id)
        with open(BASE_DIR + image.data.url, "rb") as f:
            return HttpResponse(f.read(), content_type="image/jpeg")

class OutputView(View):
    def get(self, request, *args, **kwargs):
        output=Output.objects.get(id=kwargs['pk'])
        with open(output.data.path, "rb") as f:
            return HttpResponse(f.read(), content_type="image/jpeg")
        
class ProductView(View):
    def get(self, request, *args, **kwargs):
        product=Product.objects.get(id=kwargs['pk'])
        with open(product.data.path, "rb") as f:
            return HttpResponse(f.read(), content_type="image/jpeg")

class OutputListDetail(ListView):
    template_name = 'list.html'
    subheadertext='Products:'
    model = Product
    def get_context_data(self, **kwargs):
        context = super(OutputListDetail, self).get_context_data(**kwargs)
        context['table'] = ProductTable(
            Product.objects.filter(output=self.kwargs['pk']))
        return context


    
    
          
