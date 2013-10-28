# coding: utf-8

''' index page view '''
from django.views.generic.base import TemplateView


class MainPageView(TemplateView):
    template_name = "mainpage/index.html"
    