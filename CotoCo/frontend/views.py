from django.shortcuts import render
from django.contrib.auth.decorators import login_required

# Create your views here.

from django.views.generic import TemplateView

@login_required
def LandingView(request):

    return render(request, '../templates/layout/landing.jade')


class AppView(TemplateView):

    template_name = 'app/app.html'


