from django.shortcuts import render
from django.shortcuts import redirect
# Create your views here.

from django.views.generic import TemplateView


def LandingView(request):

    return redirect('/admin/')


class AppView(TemplateView):

    template_name = 'app/app.html'


