# Name: urls.py
# Author: HuangHao
# Time: 2020/9/17 10:45

from django.urls import path
from zooapi import views
from zooapi import api
from zooapi.api import user, article, folder, comment, image

app_name = 'zooapi'
urlpatterns = [
    path('', views.index),
    # path('user', views.index),
    path('user', api.user.deal_with_method),
    path('article', api.article.deal_with_method),
    path('folder', api.folder.deal_with_method),
    path('comment', api.comment.deal_with_method),
    path('image', api.image.deal_with_method)
]

