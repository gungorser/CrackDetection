from django.forms.models import ModelForm
from data.models import Dataset
from django.forms.forms import Form
from django import forms

class DatasetForm(ModelForm):
    class Meta:
        model = Dataset
        fields = ['name', 'description']
        
