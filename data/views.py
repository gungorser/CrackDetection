from django.views.generic.edit import CreateView, DeleteView
from data.models import Dataset, Image, DatasetImage
from django.urls.base import reverse_lazy, reverse
from django.views.generic.list import ListView
from data.tables import DatasetTable, ImageTable, \
    ImageAddedTable
from django.utils import timezone
from django_tables2.config import RequestConfig
from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic.base import View
from CrackDetection.settings import BASE_DIR
from django.http.response import HttpResponse
from data.forms import DatasetForm

class DatasetCreate(CreateView):
    model = Dataset
    fields = ['name', 'description']
    template_name = 'dataset.html'
    success_url = reverse_lazy('dataset-list')
    
class DatasetUpdate(View):
    template_name = 'dataset.html'
    success_url = reverse_lazy('dataset-list')
    
    def get(self, request, *args, **kwargs):
        dataset = Dataset.objects.get(id=kwargs['pk'])
        form = DatasetForm(instance=dataset)
        images=DatasetImage.objects.all()
        table=ImageAddedTable(images )
        return render(request, 'dataset.html', {
            'form': form, 
            'table': table,
            'pk': kwargs['pk']
        })
    
    def post(self, request, *args, **kwargs):
        dataset = get_object_or_404(Dataset, pk=kwargs['pk'])
        form = DatasetForm(request.POST, instance=dataset)
        if form.is_valid():
            dataset = form.save()
            return redirect(self.success_url)

class DatasetAddImageList(ListView):
    model = Image
    paginate_by = 100
    template_name = 'list.html'
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['table'] = ImageTable(Dataset.objects.all())
        return context
    
class DatasetDelete(DeleteView):
    model = Dataset
    template_name = 'delete.html'
    success_url = reverse_lazy('dataset-list')

class DatasetList(ListView):
    model = Dataset
    paginate_by = 100
    template_name = 'list.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['now'] = timezone.now()
        table = DatasetTable(Dataset.objects.all())
        RequestConfig(self.request, paginate={'per_page': 10}).configure(table)
        context['table'] = table
        context['urladdr'] = reverse_lazy('dataset-create')
        context['modelname'] = 'dataset'
        return context
    
class ImageCreate(CreateView):
    model = Image
    fields = ['name', 'document']
    template_name = 'image.html'
    success_url = reverse_lazy('image-list')

class ImageList(ListView):
    model = Image
    paginate_by = 100
    template_name = 'list.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['now'] = timezone.now()
        table = ImageTable(Image.objects.all())
        RequestConfig(self.request, paginate={'per_page': 10}).configure(table)
        context['table'] = table
        context['urladdr'] = reverse_lazy('image-create')
        context['modelname'] = 'image'
        return context

class ImageView(View):
    template_name = 'image_view.html'
    def get(self, request, *args, **kwargs):
        image_id=kwargs['pk']
        image=Image.objects.get(id=image_id)
        with open(BASE_DIR + image.document.url, "rb") as f:
            return HttpResponse(f.read(), content_type="image/jpeg")

class ImageDelete(DeleteView):
    model = Image
    template_name = 'delete.html'
    success_url = reverse_lazy('image-list')

class DatasetImageDelete(View):
    def get(self, request, *args, **kwargs):
        di = DatasetImage.objects.filter(dataset_id=kwargs['pk1'], image_id=kwargs['pk2'])
        di.delete()
        return redirect('dataset-update', kwargs['pk1'])

class DatasetImageCreate(View):
    def get(self, request, *args, **kwargs):
        dataset=Dataset.objects.get(id=kwargs['pk1'])
        image=Image.objects.get(id=kwargs['pk2'])
        di = DatasetImage.objects.create(dataset=dataset, image=image)
        di.save()
        return redirect('dataset-update', kwargs['pk1'])
    
class DatasetImageList(ListView):
    model = Image
    paginate_by = 10
    template_name = 'list.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['now'] = timezone.now()
        table = ImageAddedTable(Image.objects.all())
        RequestConfig(self.request, paginate={'per_page': 10}).configure(table)
        context['table'] = table
        return context
    
    
    
    
    