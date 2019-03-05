from django.db import models

# Create your models here.

class Image(models.Model):
    name = models.CharField(max_length=30)
    data = models.ImageField()
    
class Dataset(models.Model):
    name = models.CharField(max_length=30)
    description = models.CharField(max_length=30)
    
class DatasetImage(models.Model):
    image = models.ForeignKey(Image, on_delete=models.PROTECT)
    dataset = models.ForeignKey(Dataset, on_delete=models.PROTECT)

class Output(models.Model):
    algorithm = models.CharField(max_length=30)
    image = models.ForeignKey(Image, on_delete=models.PROTECT)
    data = models.ImageField(null=True)
