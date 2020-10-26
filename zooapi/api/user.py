# Name: user.py
# Author: HuangHao
# Time: 2020/9/18 11:02

from django.http import HttpResponse, JsonResponse
from zooapi.models import User
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
    获取指定用户信息
    @param request: HttpRequest对象
    @return: JsonResponse
    """
    try:
        # user_id = request.session.get('user_id')
        user_id = request.GET.get('user_id')
        jsonobj = {}
        user = User.objects.get(pk=user_id)
        jsonobj['id'] = user.id
        jsonobj['username'] = user.username
        jsonobj['nickname'] = user.nickname
        if user.gender:
            jsonobj['gender'] = '男'
        else:
            jsonobj['gender'] = '女'
        jsonobj['email'] = user.email
        jsonobj['tel'] = user.tel
        jsonobj['logo_url'] = user.logo_url
        jsonobj['socre'] = user.socre
        jsonobj['birth'] = user.birth
        jsonobj['areaCode'] = user.areaCode.__str__()
        jsonobj['address'] = user.address
        jsonobj['personalInfo'] = user.personalInfo
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=404)
        return res
    return JsonResponse(jsonobj)


def post(request):
    """
    新增用户
    @param request:
    @return:
    """

    try:
        query_dict = request.POST
        username = query_dict.get('username')
        uuid = hashlib.md5("uuid-{}-{}".format(time.time(), username).encode('utf-8')).hexdigest()
        password = hashlib.md5((query_dict.get('password')).encode('utf-8')).hexdigest()
        nickname = query_dict.get('nickname')
        realName = query_dict.get('realName')
        if query_dict.get('gender') == '女':
            gender = False
        else:
            gender = True
        email = query_dict.get('email')
        tel = query_dict.get('tel')
        logo_url = query_dict.get('logo_url')
        socre = query_dict.get('socre')
        birth = query_dict.get('birth')
        areaCode = query_dict.get('areaCode')
        address = query_dict.get('address')
        personalInfo = query_dict.get('personalInfo')
        new_user = User(uuid=uuid, username=username, password=password, nickname=nickname, realName=realName,
                        gender=gender,
                        email=email, tel=tel, logo_url=logo_url, socre=socre, birth=birth, areaCode=areaCode,
                        address=address, personalInfo=personalInfo)
        new_user.save()
        print('新增成功')
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
        username = query_dict.get('username')
        old_user = User.objects.get(pk=user_id, username=username)
        # password = hashlib.md5((query_dict.get('password')).encode('utf-8')).hexdigest()
        if query_dict.get('password') is not None:
            old_password = query_dict.get('old_password')
            if old_user.password != hashlib.md5(old_password.encode('utf-8')).hexdigest():
                return JsonResponse({'results': 'error', 'error': '旧密码不正确'})
            old_user.password = hashlib.md5((query_dict.get('password')).encode('utf-8')).hexdigest()
        if query_dict.get('nickname') is not None:
            old_user.nickname = query_dict.get('nickname')
        if query_dict.get('realName') is not None:
            old_user.nickname = query_dict.get('realName')
        if query_dict.get('gender') is not None:
            if query_dict.get('gender') == '男':
                old_user.gender = True
            else:
                old_user.gender = False
        if query_dict.get('email') is not None:
            old_user.email = query_dict.get('email')
        if query_dict.get('tel') is not None:
            old_user.tel = query_dict.get('tel')
        if query_dict.get('logo_url') is not None:
            old_user.logo_url = query_dict.get('logo_url')
        if query_dict.get('socre') is not None:
            old_user.socre = query_dict.get('socre')
        if query_dict.get('birth') is not None:
            old_user.birth = query_dict.get('birth')
        if query_dict.get('areaCode') is not None:
            old_user.areaCode = query_dict.get('areaCode')
        if query_dict.get('address') is not None:
            old_user.address = query_dict.get('address')
        if query_dict.get('personalInfo') is not None:
            old_user.personalInfo = query_dict.get('personalInfo')
        old_user.save()
    except Exception as e:
        jsonobj = {'error': e.__str__()}
        res = JsonResponse(jsonobj, status=400)
        return res
    return JsonResponse({"success": "修改成功"})


def delete(request):
    return HttpResponse("<center><h1>user delete</h1></center>")
