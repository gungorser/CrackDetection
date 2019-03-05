from django.views.generic.edit import CreateView, UpdateView, DeleteView,\
    FormView
from main.models import Image, Dataset, DatasetImage, Output
from django.views.generic.list import ListView
from main.tables import ImageTable, DatasetTable, DatasetImageTable,\
    ImageRemainingTable, OutputTable
from django.urls.base import reverse_lazy, reverse
from django.views.generic.base import View
from django.shortcuts import redirect, render
from CrackDetection.settings import BASE_DIR
from django.http.response import HttpResponse
from main.forms import AlgorithmForm
import requests
import cv2
from django.core.exceptions import PermissionDenied
from django.db.models.deletion import ProtectedError

class ProtectedErrorMixin(DeleteView):
    errortext='This object is used by others. \nDelete dependent objects first!'
    def post(self, request, *args, **kwargs):
        try:
            return DeleteView.post(self, request, *args, **kwargs)
        except ProtectedError:
            return render(self.request, 'error.html', {
                    'errortext': self.errortext
                })
            
class ImageViews:
    model = Image
    fields = ['name', 'data']
    headertext='Create & Edit Images'
    
class ImageCreate(ImageViews, CreateView):
    template_name = 'create.html'
    success_url = reverse_lazy('image-list')
    subheadertext='New Image:'

class ImageList(ImageViews, ListView):
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
    
class ImageDelete(ProtectedErrorMixin, ImageViews, DeleteView ):
    template_name = 'delete.html'
    success_url = reverse_lazy('image-list')
    subheadertext='Delete Image:'

class DatasetViews:
    model = Dataset
    fields = ['name', 'description']
    headertext='Create & Edit Datasets'
    
class DatasetCreate(DatasetViews, CreateView):
    template_name = 'create.html'
    success_url = reverse_lazy('dataset-list')
    subheadertext='New Dataset:'

class DatasetList(DatasetViews, ListView):
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

class DatasetDelete(ProtectedErrorMixin, DatasetViews, DeleteView):
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
    
class ImageView(View):
    template_name = 'view.html'
    def get(self, request, *args, **kwargs):
        image_id=kwargs['pk']
        image=Image.objects.get(id=image_id)
        with open(BASE_DIR + image.data.url, "rb") as f:
            return HttpResponse(f.read(), content_type="image/jpeg")

class CalculationsViews:
    headertext='Calculations'
    
class DatasetCalculateView(CalculationsViews, FormView):
    form_class = AlgorithmForm
    template_name = 'create.html'
    subheadertext='Run algorithm for the dataset:'
    
    def form_valid(self, form):
        dsimages = DatasetImage.objects.filter(dataset_id=form.data['dataset'])
        algorithm = form.data['algorithm']
        
        for dsimage in dsimages:
            output, created = Output.objects.get_or_create(algorithm=algorithm, image=dsimage.image)
            output.save()
            uri = reverse(algorithm, args=[output.id])
            url = self.request.build_absolute_uri(uri)
            requests.get(url)
        
        return redirect(reverse('output-list', args=[form.data['algorithm'], form.data['dataset']]))
        

class OutputList(CalculationsViews, ListView):
    model = Output
    template_name = 'list.html'
    subheadertext='Results:'   
    
    def get_context_data(self, **kwargs):
        context = super(OutputList, self).get_context_data(**kwargs)
        dsimages= DatasetImage.objects.filter(dataset=self.kwargs['dsid'])
        images=dsimages.values_list('image__id', flat=True)
        
        outputs = OutputTable(Output.objects.filter(image__in=images))
        context['table'] = outputs
        return context

class AlgorithmExecutionBase(View):
    template_name = 'view.html'
    def get(self, request, *args, **kwargs):
        output = Output.objects.get(id=kwargs['pk'])
        output_path = output.image.data.path + '_' + str(output.id)
        img = cv2.imread(output.image.data.path, 0)
        try:
            self.execute(img, output_path)
            with open(output_path, "rb") as fo:
                output.data = output_path
                output.save()
        except:
            return HttpResponse(status=400)
        return HttpResponse(status=200)
    
    def execute(self, image, output_path):
        pass
    
class ThresholdView(AlgorithmExecutionBase):
    def execute(self, image, output_path):
        ret,thresh1 = cv2.threshold(image,127,255,cv2.THRESH_BINARY)
        cv2.imwrite(output_path, thresh1)

class OutputView(View):
    template_name = 'view.html'
    def get(self, request, *args, **kwargs):
        output=Output.objects.get(id=kwargs['pk'])
        with open(output.data.path, "rb") as f:
            return HttpResponse(f.read(), content_type="image/jpeg")
        
        
    
    
    
          
