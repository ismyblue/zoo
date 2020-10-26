# Name: image_code.py
# Author: HuangHao
# Time: 2020/9/30 22:06


from django.http import HttpResponse
from zoo.settings import IMAGE_CODE_EXPIRE
import random
from PIL import Image, ImageDraw, ImageFont  # pip install pillow
from io import BytesIO


def image_code(request):
    img, char_code = get_image_code()
    # 将图片数据写道内存
    stream = BytesIO()
    img.save(stream, format='png')

    # 将图片验证码保存到session中
    request.session['image_code'] = char_code
    # 图片验证码有效期，单位秒 300秒
    request.session.set_expiry(IMAGE_CODE_EXPIRE)
    return HttpResponse(stream.getvalue(), content_type='image/webp')


def get_image_code():
    """
    随机生成图片验证码
    @return:
    """
    # 通过数字获取ascii表中的对应字母
    def get_char():
        return chr(random.randint(65, 90))

    # 获取随机颜色
    def get_color(*args):
        if args == ():
            return (random.randint(0, 255), random.randint(0, 255), random.randint(0, 255))
        while True:
            text_color = get_color()
            aberration = 3 * (text_color[0] - args[0][0]) ** 2 + 4 * (text_color[0] - args[0][1]) ** 2 + 2 * (
                        text_color[0] - args[0][2]) ** 2
            rgb2 = 100000  # 设置字体颜色与背景色差，值越大，字体越清晰，机器人就更容易识别，相对应的代价就是需要随机更多次的RGB值。极端情况验证码字体背景rgb均为128，aberration最小的最大值为147456
            if aberration > rgb2:
                return text_color

    # 创建图片对象
    img_back = get_color()
    img = Image.new(mode='RGB', size=(120, 50), color=img_back)
    # 创建画笔对象
    draw = ImageDraw.Draw(img, mode='RGB')
    # 噪点 xy：基于图片的坐标，fill表示点颜色
    for i in range(50):
        draw.point([random.randint(0, 120), random.randint(0, 50)], fill=get_color())

    # 噪线 xy:(起点坐标，终点坐标) fill：颜色  width：线宽
    # draw.line((50, 30, 100, 60),fill='purple', width=5)
    for i in range(5):
        draw.line([random.randint(0, 120), random.randint(0, 50), random.randint(0, 120), random.randint(0, 50)],
                  fill=get_color())
    # 划圆或弧线
    for i in range(5):
        x = random.randint(0, 120)
        y = random.randint(0, 50)
        x2 = x + 4
        y2 = y + 4

        draw.arc((x, y, x2, y2), 0, 90, fill=get_color())

    # font = ImageFont.truetype('fonts/domi.ttf', 30)
    font = ImageFont.truetype('arial.ttf', size=30)

    # 用来拼接验证码字符的
    char_list = []
    for i in range(5):
        char = get_char()
        char_list.append(char)
        height = random.randint(10, 15)
        draw.text([18 * (i + 1), height], char, get_color(img_back), font=font)#, font=font)

    char_code = ''.join(char_list)

    # 模糊效果和边缘增强效果
    # img = img.filter(ImageFilter.BLUR)
    # img = img.filter(ImageFilter.EDGE_ENHANCE_MORE)

    return img, char_code
