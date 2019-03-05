'''
Created on Mar 4, 2019

@author: user
'''
from django.urls.conf import path
from main.views import ImageCreate, ImageList, ImageUpdate, ImageDelete,\
    DatasetList, DatasetCreate, DatasetUpdate, DatasetDelete, DatasetImageCreate,\
    DatasetAddImage, DatasetImageDelete, ImageView, DatasetCalculateView, ThresholdView,\
    OutputView

urlpatterns = [
    path('images/',                 ImageList.as_view(),    name='image-list'),
    path('images/create',           ImageCreate.as_view(),  name='image-create'),
    path('images/<slug:pk>',        ImageUpdate.as_view(),  name='image-update'),
    path('images/<slug:pk>/view',   ImageView.as_view(),  name='image-view'),
    path('images/<slug:pk>/delete', ImageDelete.as_view(),  name='image-delete'),
    path('datasets/',                 DatasetList.as_view(),    name='dataset-list'),
    path('datasets/create',           DatasetCreate.as_view(),  name='dataset-create'),
    path('datasets/<slug:pk>',        DatasetUpdate.as_view(),  name='dataset-update'),
    path('datasets/<slug:pk>/delete', DatasetDelete.as_view(),  name='dataset-delete'),
    path('datasets/<slug:pk>/addimage',    DatasetAddImage.as_view(),  name='dataset-addimage'),
    path('datasets/<slug:dsid>/image/<slug:imid>',  DatasetImageCreate.as_view(),  name='datasetimage-create'),
    path('datasets/<slug:dsid>/image/<slug:imid>/delete', DatasetImageDelete.as_view(),  name='datasetimage-delete'),
    path('algorithms/', DatasetCalculateView.as_view(),  name='algorithm'),
    path('outputs/<slug:pk>', OutputView.as_view(),  name='output-view'),
    path('threshold/<slug:pk>/', ThresholdView.as_view(),  name='threshold'),

]