from django.db import models

"""
Area
User
Admin
Subscribe
Label
Article
MidArticleLabel
Folder
Like
Comment
Image
"""


class Area(models.Model):
    """
    行政区划表
    """

    class Meta:
        db_table = 'ums_area'

    province = models.CharField(max_length=255, null=True, help_text='省/直辖市')
    city = models.CharField(max_length=255, null=True, help_text='市/县级市')
    district = models.CharField(max_length=255, null=True, help_text='区/县')
    area_code = models.CharField(max_length=6, null=True, help_text='行政区划码')


# 继承djnago.db.models.Model类，一个模型类相当于一个数据库表结构，每个属性都相当于一个数据库表的字段。
class User(models.Model):
    """
    用户信息表
    """

    # 内部类，自定义sql语句中的表名
    class Meta:
        db_table = 'ums_user'

    # db_column表示指定sql语句中字段名
    uuid = models.CharField(max_length=255, help_text='用户唯一标识')
    username = models.CharField(max_length=255, help_text='用户名')
    password = models.CharField(max_length=255, help_text='密码')
    nickname = models.CharField(max_length=255, null=True, help_text='昵称')
    realName = models.CharField(max_length=255, null=True, help_text='真实姓名')
    gender = models.BooleanField(null=True, help_text='性别')
    email = models.CharField(max_length=255, null=True, help_text='邮箱')
    tel = models.CharField(max_length=11, null=True, help_text='手机号码（11位）')
    # image = models.ForeignKey(Image, on_delete=models.SET_NULL, null=True, help_text='头像图片地址')
    logo_url = models.FilePathField(help_text='头像图片地址')
    socre = models.IntegerField(default=0, help_text='积分')
    enable = models.BooleanField(default=True, help_text='账号启用状态，0/禁用，1/启用')
    birth = models.DateTimeField(null=True, help_text='生日')
    areaCode = models.ForeignKey(Area, on_delete=models.SET_NULL, null=True, help_text='行政区划码')
    address = models.CharField(max_length=255, null=True, help_text='详细地址')
    personalInfo = models.CharField(max_length=255, null=True, help_text='个人简介')
    createTime = models.DateTimeField(auto_now=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now_add=True, help_text='更新时间')


class Admin(models.Model):
    """
    管理员表
    """

    class Meta:
        db_table = 'ums_admin'

    username = models.CharField(max_length=255, help_text='管理员账号')
    password = models.CharField(max_length=255, help_text='管理员密码')
    degree = models.SmallIntegerField(help_text="管理员级别：1/超级管理员；2/普通管理员")
    createTime = models.DateTimeField(auto_now=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now_add=True, help_text='更新时间')


class Subscribe(models.Model):
    """
    关注表
    """

    class Meta:
        db_table = 'ums_subscribe'

    user_id = models.ForeignKey(User, db_column='user_id', on_delete=models.CASCADE, help_text='被关注者的id')
    subscribe_id = models.ForeignKey(User, db_column='subscribe_id', on_delete=models.CASCADE, related_name='+',
                                     help_text='关注者的id')
    createTime = models.DateTimeField(auto_now=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now_add=True, help_text='更新时间')


class Label(models.Model):
    """
    文章标签表
    """

    class Meta:
        db_table = 'cms_label'

    label_name = models.CharField(max_length=255, help_text='标签名')
    description = models.CharField(max_length=1024, null=True, help_text='标签描述')
    creator_id = models.ForeignKey(User, db_column='creator_id', on_delete=models.SET_NULL, null=True,
                                   help_text='创建者id')
    createTime = models.DateTimeField(auto_now=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now_add=True, help_text='更新时间')


class Article(models.Model):
    """
    文章表
    """

    class Meta:
        db_table = 'cms_article'

    creator_id = models.ForeignKey(User, db_column='creator_id', on_delete=models.CASCADE, help_text='创建者id')
    title = models.CharField(max_length=255, null=True, help_text='文章标题')
    content_text = models.TextField(null=True, blank=True, help_text='文章正文纯文本格式')
    content_html = models.TextField(null=True, blank=True, help_text='文章正文html格式')
    content_json = models.TextField(null=True, blank=True, help_text='文章正文json格式')
    createTime = models.DateTimeField(auto_now=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now_add=True, help_text='更新时间')


class MidArticleLabel(models.Model):
    """
    文章-标签中间表
    """

    class Meta:
        db_table = 'cms_mid_article_article'

    article_id = models.ForeignKey(Article, db_column='article_id', on_delete=models.CASCADE, help_text='文章id，外键')
    label_id = models.ForeignKey(Label, db_column='label_id', on_delete=models.CASCADE, help_text='标签id，外键')
    createTime = models.DateTimeField(auto_now=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now_add=True, help_text='更新时间')


class Folder(models.Model):
    """
    文章文件夹表，用于分级目录
    """

    class Meta:
        db_table = 'cms_folder'

    folder_name = models.CharField(max_length=255, help_text='文件夹名')
    creator_id = models.ForeignKey(User, db_column='creator_id', on_delete=models.CASCADE, help_text='创建者id')
    parent_folder_id = models.ForeignKey('self', db_column='parent_folder_id', on_delete=models.PROTECT,
                                         help_text='上一级目录id，自关联关系')
    createTime = models.DateTimeField(auto_now=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now_add=True, help_text='更新时间')


class Like(models.Model):
    """
    文章点赞表
    """

    class Meta:
        db_table = 'cms_like'

    operator_id = models.ForeignKey(User, db_column='operator_id', on_delete=models.SET_NULL, null=True,
                                    help_text='用户id，外键')
    article_id = models.ForeignKey(Article, db_column='article_id', on_delete=models.CASCADE, help_text='文章id，外键')
    operate_type = models.BooleanField(help_text='操作类型：True喜欢/False不喜欢')
    createTime = models.DateTimeField(auto_now=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now_add=True, help_text='更新时间')


class Comment(models.Model):
    """
    文章评论表
    """

    class Meta:
        db_table = 'cms_comment'

    creator_id = models.ForeignKey(User, db_column='creator_id', on_delete=models.CASCADE, help_text='创建者id')
    article_id = models.ForeignKey(Article, db_column='article_id', on_delete=models.CASCADE, help_text='文章id，外键')
    comment_text = models.CharField(max_length=1024, help_text='评论内容文本')
    parent_comment_id = models.ForeignKey('self', db_column='parent_comment_id', on_delete=models.CASCADE,
                                          help_text='上一级评论id，自关联关系')
    createTime = models.DateTimeField(auto_now=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now_add=True, help_text='更新时间')


class Image(models.Model):
    """
    图片资源表
    """

    class Meta:
        db_table = 'rms_image'

    creator_id = models.ForeignKey(User, db_column='creator_id', on_delete=models.CASCADE, help_text='创建者id')
    image_name = models.CharField(max_length=255, help_text='图片名称')
    image_url = models.FilePathField(help_text='图片路径')
    createTime = models.DateTimeField(auto_now=True, help_text='创建时间')
    updateTime = models.DateTimeField(auto_now_add=True, help_text='更新时间')
