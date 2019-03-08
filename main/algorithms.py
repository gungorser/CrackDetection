'''
Created on Mar 7, 2019

@author: user
'''
import cv2
from django.views.generic.base import View
from main.models import Output, Product
from django.http.response import HttpResponse
from CrackDetection.settings import MEDIA_ROOT

class AlgorithmExecutionBase(View):
    template_name = 'view.html'
    
    def log_output(self, img):
        output = Output.objects.get(id=self.kwargs['pk'])
        filename = 'output_' + self.kwargs['pk'] + '.jpeg'
        cv2.imwrite(MEDIA_ROOT + '/' + filename, img)
        output.data.name=filename
        output.save()

    def log_product(self, img, title):
        product = Product.objects.get_or_create(
            output_id=self.kwargs['pk'], 
            title=title)[0]
        filename = 'product_' + self.kwargs['pk'] + '_' + str(product.id) + '.jpeg'
        cv2.imwrite(MEDIA_ROOT + '/' + filename, img)
        product.data.name = filename
        product.save()
        
    def get(self, request, *args, **kwargs):
        output = Output.objects.get(id=kwargs['pk'])
        output_path = output.image.data.path + '_' + str(output.id)
        img = cv2.imread(output.image.data.path, 0)
        self.execute(img, output_path)
        return HttpResponse(status=200)
    
    def execute(self, image, output_path):
        pass
    
class ThresholdView(AlgorithmExecutionBase):
    def execute(self, image, output_path):
        thresh1 = cv2.threshold(image,127,255,cv2.THRESH_BINARY)[1]
        self.log_product(thresh1, 'pr1')
        self.log_product(thresh1, 'pr2')
        self.log_product(thresh1, 'pr3')
        self.log_output(thresh1)

class ThresholdHighView(AlgorithmExecutionBase):
    def execute(self, image, output_path):
        thresh1 = cv2.threshold(image,200,255,cv2.THRESH_BINARY)[1]
        self.log_output(thresh1)
        
        
        
        
        
        
        
        
        
        
        