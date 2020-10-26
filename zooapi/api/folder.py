# Name: folder.py
# Author: HuangHao
# Time: 2020/9/18 11:05

from django.http import HttpResponse, JsonResponse
from zooapi.models import Folder, User
import time, hashlib


def process_method(request):
    """
    分发request到各个函数
    @param request:
    @return:
    """
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
    获取指定用户user_id的指定文件夹folder_id清单
    @param request: HttpRequest对象
    @return: JsonResponse
    """
    user_id = request.GET.get('user_id')
    folder_id = request.GET.get('folder_id')
    jsonobj = {}
    try:
        # 获取结果集
        if folder_id is None:
            folders = Folder.objects.filter(creator_id=user_id, parent_folder_id=None)
        else:
            folders = Folder.objects.filter(pk=folder_id, creator_id=user_id)

        # 1.用递归 2.用栈
        jsonobj['folders'] = []
        for f in folders:
            folder_obj = {"folder_id": f.id, "folder_name": f.folder_name}
            jsonobj['folders'].append(folder_obj)
            jsonobj[f.id] = get_child_folders(user_id=user_id, folder_id=f.id)

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=404)
        return res
    return JsonResponse(jsonobj)


def get_child_folders(user_id, folder_id):
    """
    获取某一个用户的某一个文件夹的列表清单
    @param user_id: 用户id
    @param folder_id: 文件夹id
    @return:
    """
    jsonobj = {}
    jsonobj['folders'] = []
    folders = Folder.objects.filter(creator_id=user_id, parent_folder_id=folder_id)
    for f in folders:
        folder_obj = {"folder_id": f.id, "folder_name": f.folder_name}
        jsonobj['folders'].append(folder_obj)
        jsonobj[f.id] = get_child_folders(user_id=user_id, folder_id=f.id)
    return jsonobj


def post(request):
    """
    新增文件夹
    @param request:
    @return:
    """
    try:
        query_dict = request.POST
        folder_name = query_dict.get('folder_name')
        creator_id = User.objects.get(pk=request.session.get('user_id'))
        parent_folder_id = query_dict.get('parent_folder_id')
        new_folder = Folder(folder_name=folder_name, creator_id=creator_id, parent_folder_id=parent_folder_id)
        new_folder.save()
        print('新增folder成功')
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "新增成功"})


def put(request):
    try:
        query_dict = request.PUT
        folder_id = query_dict.get('folder_id')
        folder_name = query_dict.get('folder_name')
        creator = User.objects.get(pk=request.session.get('user_id'))
        old_folder = Folder.objects.gt(pk=folder_id, creator_id=creator)
        if folder_name is not None:
            old_folder.folder_name = folder_name
        old_folder.save()
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "修改成功"})


def delete(request):
    try:
        query_dict = request.DELETE
        folder_id = query_dict.get('folder_id')
        creator = User.objects.get(pk=request.session.get('user_id'))
        folder = Folder.objects.gt(pk=folder_id, creator_id=creator)
        float.delete()
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "删除成功"})


