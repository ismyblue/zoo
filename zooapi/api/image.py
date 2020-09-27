# Name: image.py
# Author: HuangHao
# Time: 2020/9/18 11:05

from django.http import HttpResponse, JsonResponse
import os, hashlib, time
from zoo.settings import STATIC_URL, BASE_DIR
from zooapi.models import User, Folder, Article, Image


# api接口，url相同，按照请求方法不懂，分到到特定函数去处理。
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
    """
    获取自己的图片url，分页数，页码
    @param request: HttpRequest对象
    @return: JsonResponse
    """
    # 取出用户id
    request.session['user_id'] = 1
    user_id = request.session.get('user_id')
    page_size = request.GET.get('page_size')
    page_index = request.GET.get('page_index')
    jsonobj = {}
    try:
        # 查询图片
        page_size = int(page_size)
        page_index = int(page_index)
        # 分页
        images = Image.objects.all()[(page_index - 1) * page_size:page_index * page_size]
        image_array = []
        for image in images:
            image_array.append({"id": image.id, "image_name": image.image_name, "image_url": image.image_url})
        jsonobj['images'] = image_array
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=404)
        return res
    return JsonResponse(jsonobj)


def post(request):
    """
    上传图片
    @param request:
    @return:
    """

    try:
        query_dict = request.POST
        request.session['user_id'] = 1
        creator = User.objects.get(pk=request.session.get('user_id'))
        image_name = query_dict.get('image_name')
        # 如果没有自定义图片名字，就随机生成图片名字
        if image_name is None:
            image_name = hashlib.md5((creator.username + str(time.time())).encode('utf-8')).hexdigest()
        # 获取图片对象
        img = request.FILES.get('img')
        # 获取图片后缀
        name_suffix = img.name.split('.')
        file_suffix = name_suffix[-1].lower()
        if len(name_suffix) <= 1 or file_suffix not in ['png', 'jpg', 'jpeg', 'gif']:
            raise Exception('图片格式不正确（必须为png,jpeg,jpg,gif)')
        # 生成图片url
        image_url = os.path.join(STATIC_URL, 'user_images', creator.username,
                                 hashlib.md5(str(time.time()).encode('utf-8')).hexdigest()).replace('\\', '/')
        image_url = "{}.{}".format(image_url, file_suffix)
        # 保存文件
        image_path = str(BASE_DIR).replace('\\', '/') + image_url.replace(STATIC_URL, '/zooapi/static/')
        # 获取文件夹路径 ./zoo/zooapi/static/
        image_dir = os.path.dirname(image_path)
        # 如果文件夹不存在，那么就创建它
        if not os.path.exists(image_dir):
            os.mkdir(image_dir)

        with open(image_path, 'wb') as f:
            if img.multiple_chunks():   # 判断文件是否大于2.5M
                for i in img.chunks():
                    f.write(i)
            else:
                f.write(img.read())
        # 保存完毕

        image = Image(creator_id=creator, image_name=image_name, image_url=image_url)
        image.save()
        print('新增图片成功')
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "新增成功"})


def put(request):
    try:
        # 从session中取出user_id
        request.session['user_id'] = 1
        user_id = request.session.get('user_id')
        # 从参数列表中取出修改的信息，进行修改
        query_dict = request.PUT
        image_id = query_dict.get('image_id')
        image_name = query_dict.get('image_name')
        # 查询老图片
        old_image = Image.objects.get(pk=image_id)

        if image_name is not None:
            old_image.image_name = query_dict.get('image_name')
        old_image.save()
        print('修改成功')
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "修改成功"})


def delete(request):
    try:
        # 从session中取出user_id
        request.session['user_id'] = 1
        user_id = request.session.get('user_id')
        # 从参数列表中取出要删除的信息，进行删除
        query_dict = request.DELETE
        image_id = query_dict.get('image_id')
        # 查询老图片
        old_image = Image.objects.get(pk=image_id)
        old_image.delete()
        print('删除成功')
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "删除成功"})


