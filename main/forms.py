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
        ('chanvese', u"Chan Vese")
    )
    algorithm = forms.ChoiceField(choices=Algorithms)
    dataset = DatasetModelChoiceField(queryset=Dataset.objects.all())
    fields = ['algorithm', 'dataset']
