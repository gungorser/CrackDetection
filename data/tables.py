from django_tables2 import tables
from data.models import Dataset, DatasetImage, Image
from django_tables2 import A
from django.urls.base import reverse

class DatasetTable(tables.Table):
    delete = tables.columns.LinkColumn('dataset-delete', args=[A('pk')]
            , orderable=False, empty_values=())
    
    update = tables.columns.LinkColumn('dataset-update', args=[A('pk')]
            , orderable=False, empty_values=())  
    
    class Meta:
        model = Dataset
        fields = ['id', 'name', 'description', 'update', 'delete']
    

class ImageTable(tables.Table):
    delete = tables.columns.LinkColumn('image-delete', args=[A('pk')]
            , orderable=False, empty_values=())
    
    view = tables.columns.TemplateColumn('<img src="{% url \'image-view\' record.pk %}" width="40" height="40">')
    
    class Meta:
        model = Image
        fields = ['id', 'name', 'view', 'delete']

class ImageAddTable(tables.Table):
    view = tables.columns.TemplateColumn('<a href="{% url \'datasetimage-create\' view.kwargs.pk1 view.kwargs.pk2 %}">link text</a>')
    
    view = tables.columns.TemplateColumn('<img src="{% url \'image-view\' record.pk %}" width="40" height="40">')
    
    class Meta:
        model = Image
        fields = ['id', 'name', 'view', 'delete']
        
class ImageAddedTable(tables.Table):
    remove = tables.columns.LinkColumn('datasetimage-delete', args=[A('dataset'), A('image')]
        , orderable=False, empty_values=())
    
    view = tables.columns.TemplateColumn('<img src="{% url \'image-view\' record.image.id %}" width="40" height="40">')
    
    class Meta:
        model = DatasetImage
        fields = ['view', 'remove']
    

        
        
        
        
        
