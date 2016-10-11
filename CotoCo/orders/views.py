# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.template.loader import get_template
from django.template import RequestContext
from django.http import HttpResponse
from django.shortcuts import render

from rest_framework import serializers, viewsets
from .models import Order, OrderDetail
from .filters import OrderFilter, OrderDetailFilter

from weasyprint import HTML, CSS

import os

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Create your views here.

@login_required
def order_create(request):

    return render(request, '../templates/orders/create.jade')

def order_edit(request):

    return render(request, '../templates/orders/edit.jade')

def orderlist(request):

    array = request.GET['array']
    array = array.replace('[', '')
    array = array.replace(']', '')
    array = array.replace(' ', '')

    array = array.split(',')

    details = []

    for i in array:
        order = Order.objects.get(pk=i)
        details.append([i, order.order_date, order.order_supplier.supplier_name, order.order_total])


    return render(request, '../templates/orders/orderlist.jade', {'details' : details})


def orderview(request):

    ordernum = request.GET['order']

    order = Order.objects.get(pk=ordernum)

    return render(request, '../templates/orders/orderview.jade', {'order' : order})

def orderpdf2(request, pk):

    order = Order.objects.get(pk=pk)
    details = order.order_product_list.all()
    return render(request, '../templates/orders/order.jade', {'details': details, 'order': order})


def order2pdf(request, pk):

    html_template = get_template('../templates/orders/order.jade')
    order = Order.objects.get(pk=pk)
    details = order.order_product_list.all()

    rendered_html = html_template.render(RequestContext(request, {'details': details, 'order': order}))

    # pdf_file = HTML(string=rendered_html).write_pdf(stylesheets=[CSS(settings.STATIC_ROOT + 'css/app.css')])

    http_response = HttpResponse(content_type='application/pdf')

    HTML(string=rendered_html, base_url=request.build_absolute_uri()).write_pdf(http_response)

    http_response['Content-Disposition'] = 'filename="New_Order.pdf"'

    return http_response

# API


class OrderSerializer(serializers.ModelSerializer):

    class Meta:
        model = Order
        fields = ('id', 'order_date', 'order_deliver_date', 'order_supplier', 'order_project', 'order_activity',
                  'order_request', 'order_product_list', 'order_subtotal', 'order_iv', 'order_total',)


class OrderViewSet(viewsets.ModelViewSet):

    serializer_class = OrderSerializer
    queryset = Order.objects.all()
    lookup_field = 'id'
    filter_class = OrderFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)


class OrderDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = OrderDetail
        fields = ('id', 'order_detail_product', 'order_detail_product_code', 'order_detail_description',
                  'order_detail_unit', 'order_detail_price', 'order_detail_amount', 'order_detail_discount',
                  'order_detail_iv', 'order_detail_total',)


class OrderDetailViewSet(viewsets.ModelViewSet):

    serializer_class = OrderDetailSerializer
    queryset = OrderDetail.objects.all()
    lookup_field = 'id'
    filter_class = OrderDetailFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)
