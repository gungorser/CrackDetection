'''
Created on Mar 5, 2019

@author: user
'''
from django import forms
from main.models import Dataset

class DatasetModelChoiceField(forms.ModelChoiceField):
    def label_from_instance(self, obj):
        return obj.name
    
class AlgorithmForm(forms.Form):
    Algorithms = (
        ('threshold', u"Threshold"),
        ('thresholdhigh', u"Threshold High")
    )
    algorithm = forms.MultipleChoiceField(
        choices=Algorithms, 
        widget=forms.CheckboxSelectMultiple
    )
    
    dataset = DatasetModelChoiceField(
        queryset=Dataset.objects.all()
    )
    fields = ['algorithm', 'dataset']
