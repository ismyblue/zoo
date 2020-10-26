# Name: logout.py
# Author: HuangHao
# Time: 2020/9/30 22:17

from django.http import JsonResponse
from zooapi.models import User


def logout(request):
    """
    注销登录 GET
    @param request:
    @return:
    """
    request.session.flush()
    return JsonResponse({'result': 'success', 'success': '注销成功'})




