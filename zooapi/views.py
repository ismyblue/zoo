from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.


def index(request):
    from zooapi.models import Article
    article = Article.objects.get(pk=1)
    html = """
    <center>
        <h1>{}</h1>
        <h5>{}</h5>
        <p>{}</p>
        <p>{}</p>
        <p>{}</p>
    </center>    
    """.format(article.title, article.creator_id.nickname, article.content_text, article.content_html, article.content_json)
    # return HttpResponse("<center><h1 style='color: lightgreen; text-align: center'>Hello ZOO!</h1></center>")
    return HttpResponse(html)
