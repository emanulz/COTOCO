# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework import serializers, viewsets
from .models import Order, OrderDetail
from .filters import OrderFilter, OrderDetailFilter

# Create your views here.


# API


class OrderSerializer(serializers.ModelSerializer):

    class Meta:
        model = Order
        fields = ('id', 'order_date', 'order_supplier', 'order_project', 'order_activity', 'order_product_list',
                  'order_total',)


class OrderViewSet(viewsets.ModelViewSet):

    serializer_class = OrderSerializer
    queryset = Order.objects.all()
    lookup_field = 'id'
    filter_class = OrderFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)


class OrderDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = OrderDetail
        fields = ('id', 'order_detail_product', 'order_detail_price', 'order_detail_amount', 'order_detail_total',)


class OrderDetailViewSet(viewsets.ModelViewSet):

    serializer_class = OrderDetailSerializer
    queryset = OrderDetail.objects.all()
    lookup_field = 'id'
    filter_class = OrderDetailFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)
