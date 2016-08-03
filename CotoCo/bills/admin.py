# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Bill, BillDetail


@admin.register(Bill)
class BillAdmin(admin.ModelAdmin):

    def buttonEdit(self, obj):
        return '''<a type="button" class="btn btn-admin editBtn" role="button" href="/admin/bills/bill/edit/">Editar</a>'''

    buttonEdit.short_description = ''
    buttonEdit.allow_tags = True

    list_display = ('id', 'bill_date', 'bill_supplier', 'bill_order', 'bill_total', 'buttonEdit')
    search_fields = ('id', 'bill_date', 'bill_supplier',)
    filter_horizontal = ('bill_detail_list',)

    class Media:
        js = ("../static/js/admin/bills/button.js",)


@admin.register(BillDetail)
class BillDetailAdmin(admin.ModelAdmin):
    list_display = ('id', 'bill_detail_product', 'bill_detail_price', 'bill_detail_amount', 'bill_detail_total',)
    search_fields = ('id', 'bill_detail_product', 'bill_detail_price', 'bill_detail_amount', 'bill_detail_total',)
#   filter_horizontal = ('',)
