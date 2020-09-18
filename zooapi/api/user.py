# Name: user.py
# Author: HuangHao
# Time: 2020/9/18 11:02

from django.http import HttpResponse


# restful api接口，url相同，按照请求方法不懂，分到到特定函数去处理。
def deal_with_method(request):
    if request.method == 'GET':
        return get(request)
    elif request.method == 'POST':
        return post(request)
    elif request.method == 'PUT':
        return put(request)
    elif request.method == 'DELETE':
        return delete(request)
    return HttpResponse("<center><h1>No matched method: " + request.method + "</h1></center>")


def get(request):
    dic = request.GET.lists()
    html = '<center><h1>user get</h1></center>'
    print(type(dic))
    for key, valuelist in dic:
        html += '<br>' + key + ': ' + valuelist[0]
        # print(type(key), type(value), key, value)
    print(request.COOKIES)
    print(request.session)
    return HttpResponse(html + str(dir(request.session)))


def post(request):
    dic = request.POST.lists()
    html = '<center><h1>user post</h1></center>'
    print(type(dic))
    for key, valuelist in dic:
        html += '<br>' + key + ': ' + valuelist[0]
        # print(type(key), type(value), key, value)
    print(request.COOKIES)
    print(request.session)
    return HttpResponse(html)


def put(request):
    return HttpResponse("<center><h1>user put</h1></center>")


def delete(request):
    return HttpResponse("<center><h1>user delete</h1></center>")
