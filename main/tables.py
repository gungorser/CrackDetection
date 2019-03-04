'''
Created on Mar 4, 2019

@author: user
'''
from django_tables2 import tables, A
from main.models import Image, Dataset, DatasetImage, Output

class ImageTable(tables.Table):
    delete = tables.columns.LinkColumn('image-delete', args=[A('pk')]
            , orderable=False, empty_values=())
    
    update = tables.columns.LinkColumn('image-update', args=[A('pk')]
            , orderable=False, empty_values=()) 
    
    view = tables.columns.TemplateColumn('<img src="{% url \'image-view\' record.pk %}" width="40" height="40">')
    
    class Meta:
        model = Image
        fields = ['id', 'name', 'view', 'update', 'delete']

class ImageRemainingTable(tables.Table):
    add = tables.columns.TemplateColumn('<a href=" {% url \'datasetimage-create\' view.kwargs.pk record.pk %}">add</a>')
    
    view = tables.columns.TemplateColumn('<img src="{% url \'image-view\' record.pk %}" width="40" height="40">')

    class Meta:
        model = Image
        fields = ['id', 'view', 'add']
        
class DatasetTable(tables.Table):
    delete = tables.columns.LinkColumn('dataset-delete', args=[A('pk')]
            , orderable=False, empty_values=())
    
    update = tables.columns.LinkColumn('dataset-update', args=[A('pk')]
            , orderable=False, empty_values=()) 
    
    class Meta:
        model = Dataset
        fields = ['id', 'name', 'description', 'update', 'delete']
        
class DatasetImageTable(tables.Table):
    remove = tables.columns.TemplateColumn('<a href=" {% url \'datasetimage-delete\' record.dataset.pk record.image.pk %}">remove</a>')
    
    view = tables.columns.TemplateColumn('<img src="{% url \'image-view\' record.image.pk %}" width="40" height="40">')

    class Meta:
        model = DatasetImage
        fields = ['id', 'view', 'remove']
        
    def render_id(self, record):
        return record.image.id
    
class OutputTable(tables.Table):
    inputview = tables.columns.TemplateColumn('<img src="{% url \'image-view\' record.image.pk %}" width="40" height="40">')
    
    outputview = tables.columns.TemplateColumn('<img src="{% url \'output-view\' record.pk %}" width="40" height="40">')
    
    class Meta:
        model = Output
        fields = ['id', 'inputview', 'outputview']
    
    
    
    
    