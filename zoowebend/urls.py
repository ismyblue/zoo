# Name: urls.py
# Author: HuangHao
# Time: 2020/9/24 11:31


from django.urls import path, include
from zoowebend import views

app_name = 'zoowebend'
urlpatterns = [
    path('', views.index),
]
