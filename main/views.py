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

class ImageCreate(CreateView):
    model = Image
    fields = ['name', 'data']
    template_name = 'create.html'
    success_url = reverse_lazy('image-list')

class ImageList(ListView):
    model = Image
    template_name = 'list.html'
    
    def get_context_data(self, **kwargs):
        context = super(ImageList, self).get_context_data(**kwargs)
        context['addurl'] = 'image-create'
        context['table'] = ImageTable(Image.objects.all())
        return context

class ImageUpdate(UpdateView):
    model = Image
    fields = ['name', 'data']
    template_name = 'create.html'
    success_url = reverse_lazy('image-list')
    
class ImageDelete(DeleteView):
    model = Image
    template_name = 'delete.html'
    success_url = reverse_lazy('image-list')

class DatasetCreate(CreateView):
    model = Dataset
    fields = ['name', 'description']
    template_name = 'create.html'
    success_url = reverse_lazy('dataset-list')

class DatasetList(ListView):
    model = Dataset
    template_name = 'list.html'
    
    def get_context_data(self, **kwargs):
        context = super(DatasetList, self).get_context_data(**kwargs)
        context['addurl'] = 'dataset-create'
        context['table'] = DatasetTable(Dataset.objects.all())
        return context

class DatasetUpdate(UpdateView):
    model = Dataset
    fields = ['name', 'description']
    template_name = 'create.html'
    success_url = reverse_lazy('dataset-list')
    
    def get_context_data(self, **kwargs):
        context = super(DatasetUpdate, self).get_context_data(**kwargs)
        datasetimages = DatasetImage.objects.filter(dataset_id=self.kwargs['pk'])
        context['table'] = DatasetImageTable(datasetimages)
        return context
    
class DatasetDelete(DeleteView):
    model = Dataset
    template_name = 'delete.html'
    success_url = reverse_lazy('dataset-list')

class DatasetAddImage(ListView):
    model = Image
    template_name = 'list.html'
    
    def get_context_data(self, **kwargs):
        context = super(DatasetAddImage, self).get_context_data(**kwargs)
        images = list(Image.objects.all())
        dsimages = DatasetImage.objects.filter(dataset_id=self.kwargs['pk'])
        for dsimage in dsimages:
            for image in images:
                if dsimage.image.id == image.id:
                    images.remove(image)
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
    
class AlgorithmView(FormView):
    form_class = AlgorithmForm
    template_name = 'create.html'
    
    def form_valid(self, form):
        dsimages = DatasetImage.objects.filter(dataset_id=form.data['dataset'])
        algorithm = form.data['algorithm']
        
        dsimage_ids=[]
        for dsimage in dsimages:
            output, created = Output.objects.get_or_create(algorithm=algorithm, image=dsimage.image)
            output.save()
            uri = reverse(algorithm, args=[output.id])
            url = self.request.build_absolute_uri(uri)
            requests.get(url)
            dsimage_ids.append(dsimage.id) 
        
        outputs = OutputTable(Output.objects.filter(pk__in=dsimage_ids))
        return render(self.request, 'list.html', {
                'table': outputs
            })

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
        
        
    
    
    
          
