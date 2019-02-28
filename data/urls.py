from django.urls import path
from data.views import DatasetCreate, DatasetUpdate, DatasetDelete, DatasetList,\
    ImageCreate, ImageView, ImageList, ImageDelete, DatasetImageDelete,\
    DatasetImageList, DatasetImageCreate, DatasetAddImageList

urlpatterns = [
    path('dataset/', DatasetCreate.as_view(), name='dataset-create'),
    path('datasets', DatasetList.as_view(), name='dataset-list'),
    path('dataset/<slug:pk>', DatasetUpdate.as_view(), name='dataset-update'),
    path('dataset/<slug:pk>/del', DatasetDelete.as_view(), name='dataset-delete'),
    path('dataset/<slug:pk>/list', DatasetImageList.as_view(), name='datasetimage-list'),
    path('dataset/<slug:pk>/addimage', DatasetAddImageList.as_view(), name='dataset-addimage'),
    path('dataset/<slug:pk1>/image/<slug:pk2>', DatasetImageCreate.as_view(), name='datasetimage-create'),
    path('dataset/<slug:pk1>/image/<slug:pk2>/del', DatasetImageDelete.as_view(), name='datasetimage-delete'),
    path('image/', ImageCreate.as_view(), name='image-create'),
    path('images', ImageList.as_view(), name='image-list'),
    path('image/<slug:pk>', ImageView.as_view(), name='image-view'),
    path('image/<slug:pk>/del', ImageDelete.as_view(), name='image-delete'),


]