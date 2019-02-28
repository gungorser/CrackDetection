from django.db import models

class Dataset(models.Model):
    name = models.CharField(max_length=20)
    description = models.CharField(max_length=500)
    
    def __str__(self):
        return str(self.id)

class Image(models.Model):
    name = models.CharField(max_length=20)
    document = models.FileField(upload_to='documents/',null=False, blank=False)
    
    def __str__(self):
        return str(self.id)
    
    def index(self):
        return self.id

class DatasetImage(models.Model):
    dataset = models.ForeignKey('Dataset',  on_delete=models.CASCADE)
    image = models.ForeignKey('Image',  on_delete=models.CASCADE)
