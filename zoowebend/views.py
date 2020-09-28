from django.http import HttpResponse

# Create your views here.
from django.shortcuts import render


def index(request):
    return HttpResponse('<center>helloworld</center>')


def login_get(request):
    return render(request, 'login.html', {})


def login_post(request):
    print("login_post")
    return render(request, 'home.html', {"username": None})
