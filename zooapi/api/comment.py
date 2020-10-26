# Name: comment.py
# Author: HuangHao
# Time: 2020/9/18 11:05

from django.http import HttpResponse, JsonResponse
import json
from zooapi.models import User, Folder, Article, Comment


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
    获取指定文章article_id的评论comment清单
    @param request: HttpRequest对象
    @return: JsonResponse
    """
    article_id = request.GET.get('article_id')
    comment_id = request.GET.get('comment_id')
    jsonobj = {}
    try:
        # 获取结果集
        if comment_id is not None:
            comments = Comment.objects.filter(pk=comment_id)
        else:
            comments = Comment.objects.filter(article_id=article_id, parent_comment_id=None)

        # 1.用递归 2.用栈
        jsonobj['comments'] = []
        for c in comments:
            comment_obj = {"comment_id": c.id, "comment_text": c.comment_text}
            jsonobj['comments'].append(comment_obj)
            jsonobj[c.id] = get_child_comments(comment_id=c.id)

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=404)
        return res
    return JsonResponse(jsonobj)


def get_child_comments(comment_id):
    """
    获取某一个评论的子评论清单
    comment_id:
    @return:
    """
    jsonobj = {}
    jsonobj['comments'] = []
    comments = Comment.objects.filter(parent_comment_id=comment_id)
    for c in comments:
        comment_obj = {"comment_id": c.id, "comment_text": c.comment_text}
        jsonobj['comments'].append(comment_obj)
        jsonobj[c.id] = get_child_comments(comment_id=c.id)
    return jsonobj


def post(request):
    """
    新增评论
    @param request:
    @return:
    """
    try:
        creator = User.objects.get(pk=request.session.get('user_id'))
        query_dict = request.POST
        article_id = query_dict.get('article_id')
        article = Article.objects.get(pk=article_id)
        parent_comment_id = query_dict.get('parent_comment_id')
        comment_text = query_dict.get('comment_text')
        if parent_comment_id is not None:
            parent_comment = Comment.objects.get(pk=parent_comment_id)
            new_comment = Comment(creator_id=creator, article_id=article, comment_text=comment_text,
                                  parent_comment_id=parent_comment)
        else:
            new_comment = Comment(creator_id=creator, article_id=article, comment_text=comment_text,
                                  parent_comment_id=None)
        new_comment.save()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "新增成功"})


def put(request):
    pass
    return JsonResponse({"success": "put成功"})


def delete(request):
    return HttpResponse("<center><h1>comment delete</h1></center>")
