# Name: article.py
# Author: HuangHao
# Time: 2020/9/18 11:03

from django.http import HttpResponse, JsonResponse
from zooapi.models import User, Folder, Article


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
    获取指定用户的指定文件夹下的文章
    @param request: HttpRequest对象
    @return: JsonResponse
    """
    article_id = request.GET.get('article_id')
    folder_id = request.GET.get('folder_id')
    user_id = request.GET.get('user_id')
    print(article_id, folder_id, user_id)
    jsonobj = {}
    try:
        articles = []
        if article_id is not None:
            articles = Article.objects.filter(pk=article_id)
        elif folder_id is not None:
            articles = Article.objects.filter(folder_id=folder_id)
        elif user_id is not None:
            articles = Article.objects.filter(creator_id=user_id, folder_id=folder_id)

        atcs = []
        for article in articles:
            atc = {}
            atc['article_id'] = article.id
            atc['creator_id'] = article.creator_id.id
            if article.folder_id is not None:
                atc['folder_id'] = article.folder_id.id
            else:
                atc['folder_id'] = None
            atc['title'] = article.title
            atc['content_html'] = article.content_html
            atc['content_text'] = article.content_text
            atc['content_json'] = article.content_json
            atcs.append(atc)
        jsonobj['articles'] = atcs
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=404)
        return res
    return JsonResponse(jsonobj)


def post(request):
    """
    发表文章
    @param request:
    @return:
    """

    try:
        query_dict = request.POST
        creator = User.objects.get(pk=request.session.get('user_id'))
        folder = Folder.objects.get(pk=query_dict.get('folder_id'))
        title = query_dict.get('title')
        content_html = query_dict.get('content_html')
        content_text = query_dict.get('content_text')
        content_json = query_dict.get('content_json')
        article = Article(creator_id=creator, folder_id=folder, title=title, content_text=content_text,
                          content_json=content_json, content_html=content_html)
        article.save()

    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "新增成功"})


def put(request):
    try:
        # 从session中取出user_id
        user_id = request.session.get('user_id')
        # 从参数列表中取出修改的信息，进行修改
        query_dict = request.PUT
        article_id = query_dict.get('article_id')
        old_article = Article.objects.get(pk=article_id, creator_id=user_id)
        if query_dict.get('title') is not None:
            old_article.title = query_dict.get('title')
        if query_dict.get('folder_id') is not None:
            folder = Folder.objects.get(pk=query_dict.get('folder_id'))
            old_article.folder_id = folder
        if query_dict.get('content_text') is not None:
            old_article.content_text = query_dict.get('content_text')
        if query_dict.get('content_html') is not None:
            old_article.content_html = query_dict.get('content_html')
        if query_dict.get('content_json') is not None:
            old_article.content_json = query_dict.get('content_json')
        old_article.save()
        print('修改成功')
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "修改成功"})


def delete(request):
    try:
        # 从session中取出user_id
        user_id = request.session.get('user_id')
        # 从参数列表中取出修改的信息，进行修改
        query_dict = request.DELETE
        article_id = query_dict.get('article_id')
        old_article = Article.objects.get(pk=article_id, creator_id=user_id)
        old_article.delete()
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "删除成功"})
