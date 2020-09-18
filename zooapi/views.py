from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.


def index(request):
    return HttpResponse("<center><h1 style='color: lightgreen; text-align: center'>Hello ZOO!</h1></center>")

