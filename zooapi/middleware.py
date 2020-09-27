# Name: middleware.py
# Author: HuangHao
# Time: 2020/9/25 10:49

# 中间件，类似java的过滤器

from django.http import QueryDict
try:
    from django.utils.deprecation import MiddlewareMixin
except ImportError:
    MiddlewareMixin = object


class DealWithPutDeleteMiddleware(MiddlewareMixin):
    """
    中间件，处理HttpRequest的put，delete方法上传的参数
    """
    def process_request(self, request):
        try:
            http_method = request.META['REQUEST_METHOD']
            if http_method.upper() not in ('GET', 'POST'):
                setattr(request, http_method.upper(), QueryDict(request.body))
        except Exception as e:
            pass
        finally:
            return None





