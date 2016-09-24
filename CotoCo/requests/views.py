# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.template.loader import get_template
from django.template import RequestContext
from django.http import HttpResponse
from django.shortcuts import render

from rest_framework import serializers, viewsets
from .models import Request, RequestDetail
from .filters import RequestFilter, RequestDetailFilter

from weasyprint import HTML, CSS

import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Create your views here.
def request_menu(request):

    return render(request, '../templates/requests/menu.jade')

def request_create(request):

    return render(request, '../templates/requests/create.jade')

def request_edit(request):

    return render(request, '../templates/requests/edit.jade')

def requestlist(request):

    array = request.GET['array']
    array = array.replace('[', '')
    array = array.replace(']', '')
    array = array.replace(' ', '')

    array = array.split(',')

    details = []

    for i in array:
        request2 = Request.objects.get(pk=i)
        details.append([i, request2.request_date, request2.request_project.project_name, request2.request_activity.activity_name])

    return render(request, '../templates/requests/requestlist.jade', {'details' : details})


def requestview(requestobj):

    requestnum = requestobj.GET['request']

    request = Request.objects.get(pk=requestnum)

    return render(requestobj, '../templates/requests/requestview.jade', {'request' : request})


def requestpdf2(requestobj, pk):

    request = Request.objects.get(pk=pk)
    details = request.request_product_list.all()
    return render(requestobj, '../templates/requests/request.jade', {'details': details, 'request': request})


def order2pdf(request, pk):

    html_template = get_template('../templates/orders/order.jade')
    order = Request.objects.get(pk=pk)
    details = order.order_product_list.all()

    rendered_html = html_template.render(RequestContext(request, {'details': details, 'order': order}))

    # pdf_file = HTML(string=rendered_html).write_pdf(stylesheets=[CSS(settings.STATIC_ROOT + 'css/app.css')])

    http_response = HttpResponse(content_type='application/pdf')

    HTML(string=rendered_html, base_url=request.build_absolute_uri()).write_pdf(http_response)

    http_response['Content-Disposition'] = 'filename="New_Order.pdf"'

    return http_response

# API


class RequestSerializer(serializers.ModelSerializer):

    class Meta:
        model = Request
        fields = ('id', 'request_date', 'request_project', 'request_activity', 'request_product_list',)


class RequestViewSet(viewsets.ModelViewSet):

    serializer_class = RequestSerializer
    queryset = Request.objects.all()
    lookup_field = 'id'
    filter_class = RequestFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)


class RequestDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = RequestDetail
        fields = ('id', 'request_detail_product', 'request_detail_product_code', 'request_detail_description',
                  'request_detail_unit', 'request_detail_amount', )


class RequestDetailViewSet(viewsets.ModelViewSet):

    serializer_class = RequestDetailSerializer
    queryset = RequestDetail.objects.all()
    lookup_field = 'id'
    filter_class = RequestDetailFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)
