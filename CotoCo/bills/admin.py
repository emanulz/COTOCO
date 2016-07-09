# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Bill, BillDetail


@admin.register(Bill)
class BillAdmin(admin.ModelAdmin):
    list_display = ('id', 'bill_date', 'bill_supplier', 'bill_total',)
    search_fields = ('id', 'bill_date', 'bill_supplier',)
    filter_horizontal = ('bill_product_list',)


@admin.register(BillDetail)
class BillDetailAdmin(admin.ModelAdmin):
    list_display = ('id', 'bill_detail_product', 'bill_detail_price', 'bill_detail_amount', 'bill_detail_total',)
    search_fields = ('id', 'bill_detail_product', 'bill_detail_price', 'bill_detail_amount', 'bill_detail_total',)
#   filter_horizontal = ('',)
