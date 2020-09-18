# Name: urls.py
# Author: HuangHao
# Time: 2020/9/17 10:45

from django.urls import path
from zooapi import views
from zooapi import api
from zooapi.api import user

app_name = 'zooapi'
urlpatterns = [
    path('', views.index),
    # path('user', views.index),
    path('user', api.user.deal_with_method)
]

