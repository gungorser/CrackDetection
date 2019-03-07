'''
Created on Mar 4, 2019

@author: user
'''
from django_tables2 import tables, A
from main.models import Image, Dataset, DatasetImage, Output
from CrackDetection.settings import IMAGE_HEIGHT

def image_template(viewname, *args):
    argval=''
    for arg in args:
        argval = argval + ' ' + arg
    url = '{% url \''+viewname+'\''+argval+' %}'
    return '<a href="'+url+'"><img src="'+url+'" height="'+str(IMAGE_HEIGHT)+'"></a>'

class ImageTable(tables.Table):
    delete = tables.columns.LinkColumn('image-delete', args=[A('pk')]
            , orderable=False, empty_values=())
    
    update = tables.columns.LinkColumn('image-update', args=[A('pk')]
            , orderable=False, empty_values=()) 
    
    view = tables.columns.TemplateColumn(image_template('image-view', 'record.pk'))
    
    class Meta:
        model = Image
        fields = ['id', 'name', 'view', 'update', 'delete']

class ImageRemainingTable(tables.Table):
    add = tables.columns.TemplateColumn(image_template('datasetimage-create', 'view.kwargs.pk', 'record.pk'))
    view = tables.columns.TemplateColumn(image_template('image-view', 'record.pk'))
    
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
    remove = tables.columns.TemplateColumn(image_template('datasetimage-delete', 'record.dataset.pk',  'record.image.pk'))
    view = tables.columns.TemplateColumn(image_template('image-view', 'record.image.pk'))

    class Meta:
        model = DatasetImage
        fields = ['id', 'view', 'remove']
        
    def render_id(self, record):
        return record.image.id
    
class OutputTable(tables.Table):
    caption = tables.columns.Column(empty_values=())
    inputview = tables.columns.TemplateColumn(image_template('image-view', 'record.image.pk'))
    outputview = tables.columns.TemplateColumn(image_template('output-view', 'record.pk'))
    
    class Meta:
        model = Output
        fields = ['caption', 'inputview', 'outputview']

class OutputTable_Algorithm(OutputTable): 
    def render_caption(self, record):
        return record.algorithm
        
class OutputTable_Image(OutputTable):   
    def render_caption(self, record):
        return record.image.name
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    