# Name: label.py
# Author: HuangHao
# Time: 2020/9/18 11:03

from django.http import HttpResponse, JsonResponse
from zooapi.models import User, Label, Article


# api接口，url相同，按照请求方法不懂，分到到特定函数去处理。
def process_method(request):
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
    """
    获取指定用户的标签信息
    @param request: HttpRequest对象
    @return: JsonResponse
    """

    jsonobj = {}
    try:
        user_id = request.session.get('user_id')
        labels = Label.objects.filter(creator_id=user_id)
        label_array = []
        for label in labels:
            label_array.append({'label_id': label.id, 'label_name': label.label_name, 'description': label.description})
        jsonobj['labels'] = label_array

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=404)
        return res
    return JsonResponse(jsonobj)


def post(request):
    """
    新增label
    @param request:request.session['user_id']
    @return:
    """
    try:
        # 获取当前登录用户的user_id
        user_id = request.session.get('user_id')
        user = User.objects.get(pk=user_id)
        query_dict = request.POST
        label_name = query_dict.get('label_name')
        description = query_dict.get('description')
        label = Label(label_name=label_name, description=description, creator_id=user)
        label.save()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "新增成功"})


def put(request):
    try:
        # 获取当前登录用户的user_id
        user_id = request.session.get('user_id')
        query_dict = request.PUT
        label_id = query_dict.get('label_id')
        label = Label.objects.get(pk=label_id, creator_id=user_id)
        # 开始更新
        label_name = query_dict.get('label_name')
        if label_name is not None:
            label.label_name = label_name
        description = query_dict.get('description')
        if description is not None:
            label.description = description
        label.save()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "修改成功"})


def delete(request):
    """
    删除label
    @param request:
    @return:
    """
    try:
        # 获取当前登录用户的user_id
        user_id = request.session.get('user_id')
        query_dict = request.DELETE
        # 获取要取消关注的文章的id
        label_id = query_dict.get('label_id')
        label = Label.objects.get(pk=label_id, creator_id=user_id)
        label.delete()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "删除成功"})
