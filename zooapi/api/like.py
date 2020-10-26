# Name: like.py
# Author: HuangHao
# Time: 2020/9/18 11:05

from django.http import HttpResponse, JsonResponse
from zooapi.models import User, Like, Article


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
    获取指定文章的点赞信息
    @param request: HttpRequest对象
    @return: JsonResponse
    """

    jsonobj = {}
    try:
        article_id = request.GET.get('article_id')
        # 获取文章的点赞信息
        likes = Like.objects.filter(article_id=article_id, operate_type=True)
        likes_array = []
        for like in likes:
            likes_array.append({'like_id': like.id, 'user_id': like.operator_id.id, 'username': like.operator_id.username})
        jsonobj['likes'] = likes_array

        # 获取文章的不喜欢信息
        dislikes = Like.objects.filter(article_id=article_id, operate_type=False)
        dislikes_array = []
        for dislike in dislikes:
            dislikes_array.append(
                {'like_id': dislike.id, 'user_id': dislike.operator_id.id, 'username': dislike.operator_id.username})
        jsonobj['dislikes'] = dislikes_array

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=404)
        return res
    return JsonResponse(jsonobj)


def post(request):
    """
    新增like
    @param request:
    @return:
    """
    try:
        # 获取当前登录用户的user_id
        user_id = request.session.get('user_id')
        user = User.objects.get(pk=user_id)
        query_dict = request.POST
        # 获取要关注的用户的id 必选
        article_id = query_dict.get('article_id')
        article = Article.objects.get(pk=article_id)

        # 先搜索是否有存在like
        exists_likes = Like.objects.filter(article_id=article_id, operator_id=user_id)
        if len(exists_likes):
            raise Exception('Like already exists')
        # 喜欢还是不喜欢 必选
        operate_type = query_dict.get('operate_type')
        if operate_type == '1':
            like_type = True
        elif operate_type == '0':
            like_type = False
        like = Like(operator_id=user, article_id=article, operate_type=like_type)
        like.save()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "新增成功"})


def put(request):
    try:
        # 获取当前登录用户的user_id
        user_id = request.session.get('user_id')
        user = User.objects.get(pk=user_id)
        query_dict = request.PUT
        # 获取要关注的用户的id 必选
        article_id = query_dict.get('article_id')

        # 喜欢还是不喜欢 必选
        operate_type = query_dict.get('operate_type')
        print(operate_type)
        if operate_type is not None:
            if operate_type == '1':
                like_type = True
            elif operate_type == '0':
                like_type = False
            # 先搜索之前的like

            old_like = Like.objects.get(article_id=article_id, operator_id=user_id)
            old_like.operate_type = like_type
            old_like.save()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "修改成功"})


def delete(request):
    """
    取消关注
    @param request:
    @return:
    """
    try:
        # 获取当前登录用户的user_id
        user_id = request.session.get('user_id')
        query_dict = request.DELETE
        # 获取要取消关注的文章的id
        article_id = query_dict.get('article_id')
        like = Like.objects.get(article_id=article_id, operator_id=user_id)
        like.delete()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "取消成功"})
