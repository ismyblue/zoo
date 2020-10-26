# Name: login.py
# Author: HuangHao
# Time: 2020/9/30 22:02

from django.http import JsonResponse
from zooapi.models import User
import hashlib


def login(request):
    """
    验证登录是否成功
    @param request:
    @return:
    """
    query_dict = request.POST
    image_code = query_dict.get('image_code')
    if image_code is None:
        return JsonResponse({'result': 'error', 'error': '请输入验证码'})
    image_code = image_code.lower()
    correct_image_code = request.session.get('image_code')
    if correct_image_code is None:
        return JsonResponse({'result': 'error', 'error': '请请求验证码'})
    correct_image_code = correct_image_code.lower()
    # 判断验证码是否正确
    if 'image_code' not in request.session or image_code != correct_image_code:
        return JsonResponse({'result': 'error', 'error': '图片验证码错误'})
    # 获取用户使用的密码
    username = query_dict.get('username')
    password = query_dict.get('password').lower()
    # 获取数据库密码
    users = User.objects.filter(username=username)
    if not len(users):
        return JsonResponse({'result': 'error', 'error': '用户不存在或密码错误'})
    user = users[0]

    # 判断密码是否正确
    # user.password进行了两次MD5运算，而password在前端只进行一次MD5运算，所以要对password再进行一次MD5运算
    if user.password == hashlib.md5(password.encode('utf-8')).hexdigest():
        request.session['user_id'] = user.id
        return JsonResponse({'result': 'success', 'success': '登录成功'})
    else:
        return JsonResponse({'result': 'error', 'error': '用户不存在或密码错误'})



