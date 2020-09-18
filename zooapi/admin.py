from django.contrib import admin
from zooapi.models import Area, User, Admin, Subscribe, Label, Article, MidArticleLabel, Folder, Like, Comment, Image

# # Register your models here.
# 注册模型，用于在admin后台管理
admin.site.register(Area)
admin.site.register(User)
admin.site.register(Admin)
admin.site.register(Subscribe)
admin.site.register(Label)
admin.site.register(Article)
admin.site.register(MidArticleLabel)
admin.site.register(Folder)
admin.site.register(Like)
admin.site.register(Comment)
admin.site.register(Image)
