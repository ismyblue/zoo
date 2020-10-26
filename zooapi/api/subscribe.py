# Name: subscribe.py
# Author: HuangHao
# Time: 2020/9/18 11:03

from django.http import HttpResponse, JsonResponse
from zooapi.models import User, Subscribe
import hashlib, time


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
    获取指定用户信息的订阅信息和被订阅信息
    @param request: HttpRequest对象
    @return: JsonResponse
    """
    user_id = request.GET.get('user_id')

    jsonobj = {}
    try:
        user = User.objects.get(pk=user_id)
        # 获取用户关注的人
        followings = Subscribe.objects.filter(subscribe_id=user.id)
        followings_json = []
        for f in followings:
            followings_json.append({"subscribe_id": f.id, "following_id": f.user_id.id, "followings_username": f.user_id.username})
        jsonobj['followings'] = followings_json
        # 获取用户的粉丝
        followers = Subscribe.objects.filter(user_id=user.id)
        followers_json = []
        for f in followers:
            followers_json.append({"subscribe_id": f.id, "follower_id": f.subscribe_id.id, "follower_username": f.subscribe_id.username})
        jsonobj['followers'] = followers_json
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=404)
        return res
    return JsonResponse(jsonobj)


def post(request):
    """
    新增关注
    @param request:
    @return:
    """
    try:
        # 获取当前登录用户的user_id
        user_id = request.session.get('user_id')
        user = User.objects.get(pk=user_id)
        query_dict = request.POST
        # 获取要关注的用户的id
        following_user_id = query_dict.get('user_id')
        following_user = User.objects.get(pk=following_user_id)
        subscribe = Subscribe(user_id=following_user, subscribe_id=user)
        subscribe.save()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "新增成功"})


def put(request):
    pass
    # return JsonResponse({"success": ""})


def delete(request):
    """
    取消关注
    @param request:
    @return:
    """
    try:
        # 获取当前登录用户的user_id
        user_id = request.session.get('user_id')
        user = User.objects.get(pk=user_id)
        query_dict = request.DELETE
        # 获取要取消关注的用户的id
        following_user_id = query_dict.get('user_id')
        following_user = User.objects.get(pk=following_user_id)
        subscribe = Subscribe(user_id=following_user, subscribe_id=user)
        subscribe.delete()
        print(subscribe)

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "取消成功"})

