# Name: urls.py
# Author: HuangHao
# Time: 2020/9/17 10:45

from django.urls import path
from zooapi import views
from zooapi import api
from zooapi.api import user, article, folder, comment, image, subscribe, like, label, midarticlelabel
from zooapi.api import image_code, login, logout

app_name = 'zooapi'
urlpatterns = [
    path('', views.index),
    # path('user', views.index),
    path('user', api.user.process_method),
    path('article', api.article.process_method),
    path('folder', api.folder.process_method),
    path('comment', api.comment.process_method),
    path('image', api.image.process_method),
    path('subscribe', api.subscribe.process_method),
    path('like', api.like.process_method),
    path('label', api.label.process_method),
    path('midarticlelabel', api.midarticlelabel.process_method),
    path('login', api.login.login),
    path('logout', api.logout.logout),
    path('image_code', api.image_code.image_code),
]

