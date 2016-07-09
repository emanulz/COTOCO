# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Order, OrderDetail


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'order_date', 'order_supplier', 'order_project', 'order_activity', 'order_total')
    search_fields = ('id', 'order_date', 'order_supplier', 'order_project', 'order_activity')
    filter_horizontal = ('order_product_list',)


@admin.register(OrderDetail)
class OrderDetailAdmin(admin.ModelAdmin):
    list_display = ('id', 'order_detail_product', 'order_detail_price', 'order_detail_amount', 'order_detail_total',)
    search_fields = ('id', 'order_detail_product', 'order_detail_price', 'order_detail_amount', 'order_detail_total',)
#   filter_horizontal = ('',)
