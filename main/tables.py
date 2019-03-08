'''
Created on Mar 4, 2019

@author: user
'''
from django_tables2 import tables, A
from main.models import Image, Dataset, DatasetImage, Product
from CrackDetection.settings import IMAGE_HEIGHT


class PhotoColumn(tables.columns.TemplateColumn):
    def __init__(self, viewname, argval, detailview=False):
        super(PhotoColumn, self).__init__(
            template_code=self.create_template(viewname, argval, detailview),
            attrs={"td": {"valign": "top", 'align': 'middle'}})
        
    def create_template(self, viewname, argval, detailview=False):
        url = '{% url \''+viewname+'\' '+argval+' %}'
        url_raw = '{% url \''+viewname+'raw\' '+argval+' %}'
        url_detail = '{% url \''+viewname+'detail\' '+argval+' %}'
        retval = '<a href="'+url+'"><img src="'+url_raw+'" height="'+str(IMAGE_HEIGHT)+'"></a>'
        if detailview:
            retval += '<br><a href="'+url_detail+'">(detail)</a>'
        return retval
        
class ImageTable(tables.Table):
    delete = tables.columns.LinkColumn('image-delete', args=[A('pk')]
            , orderable=False, text='delete')
    
    update = tables.columns.LinkColumn('image-update', args=[A('pk')]
            , orderable=False, text='update') 
    
    view = PhotoColumn('image-view', 'record.pk')
    
    class Meta:
        model = Image
        fields = ['id', 'name', 'view', 'update', 'delete']

class ImageRemainingTable(tables.Table):
    add = tables.columns.TemplateColumn('<a href=" {% url \'datasetimage-create\' view.kwargs.pk record.pk %}">add</a>')
    view = PhotoColumn('image-view', 'record.pk')
    
    class Meta:
        model = Image
        fields = ['id', 'view', 'add']
        
class DatasetTable(tables.Table):
    delete = tables.columns.LinkColumn('dataset-delete', args=[A('pk')]
            , orderable=False, text='delete')
    
    update = tables.columns.LinkColumn('dataset-update', args=[A('pk')]
            , orderable=False, text='update') 
    
    class Meta:
        model = Dataset
        fields = ['id', 'name', 'description', 'update', 'delete']
        
class DatasetImageTable(tables.Table):
    remove = tables.columns.TemplateColumn('<a href=" {% url \'datasetimage-delete\' record.dataset.pk record.image.pk %}">remove</a>')
    view = PhotoColumn('image-view', 'record.image.pk')

    class Meta:
        model = DatasetImage
        fields = ['id', 'view', 'remove']
        
    def render_id(self, record):
        return record.image.id
    
class OutputTable(tables.Table):
    name = tables.columns.TemplateColumn(template_code='{{ record.input.name }}')
    input = PhotoColumn('image-view', 'record.input.pk')

class ProductTable(tables.Table):
    view = PhotoColumn('product-view', 'record.pk')
    
    class Meta:
        model = Product
        fields = ['title', 'view',]
    
    
    
    
    
    
    
    
    
    
    
    