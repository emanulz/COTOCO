from django.shortcuts import render

# Create your views here.

from django.views.generic import TemplateView


class LandingView(TemplateView):

    template_name = 'app/index.html'


class AppView(TemplateView):

    template_name = 'app/app.html'
