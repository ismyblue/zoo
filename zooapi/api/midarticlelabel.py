# Name: midarticlelabel.py
# Author: HuangHao
# Time: 2020/9/18 11:05

from django.http import HttpResponse, JsonResponse
from zooapi.models import User, Label, Article, MidArticleLabel


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
    获取指定文章的标签信息
    @param request: HttpRequest对象
    @return: JsonResponse
    """

    jsonobj = {}
    try:
        query_dict = request.GET
        article_id = query_dict.get('article_id')
        mid_article_labels = MidArticleLabel.objects.filter(article_id=article_id)
        label_array = []
        for mid in mid_article_labels:
            label_array.append({'label_id': mid.label_id.id, 'label_name': mid.label_id.label_name,
                                'description': mid.label_id.description})

        jsonobj['labels'] = label_array

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=404)
        return res
    return JsonResponse(jsonobj)


def post(request):
    """
    新增label
    @param request:
    @return:
    """
    try:
        # 获取当前登录用户的user_id
        user_id = request.session.get('user_id')
        query_dict = request.POST
        article_id = query_dict.get('article_id')
        article = Article.objects.get(pk=article_id, creator_id=user_id)
        label_id = query_dict.get('label_id')
        label = Label.objects.get(pk=label_id, creator_id=user_id)
        mid = MidArticleLabel(article_id=article, label_id=label)
        mid.save()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "新增成功"})


def put(request):
    pass
    return JsonResponse({"success": "没有修改方法"})


def delete(request):
    """
    删除某一文章的label
    @param request:
    @return:
    """
    try:
        # 获取当前登录用户的user_id
        user_id = request.session.get('user_id')
        query_dict = request.DELETE
        article_id = query_dict.get('article_id')
        article = Article.objects.get(pk=article_id, creator_id=user_id)
        label_id = query_dict.get('label_id')
        label = Label.objects.get(pk=label_id, creator_id=user_id)
        mid = MidArticleLabel.objects.get(article_id=article.id, label_id=label.id)
        mid.delete()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "删除成功"})
