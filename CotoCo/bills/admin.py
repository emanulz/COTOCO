# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Bill, BillDetail


@admin.register(Bill)
class BillAdmin(admin.ModelAdmin):

    def view_btn(self, obj):

        return '''<a type="button" class="btn btn-admin pdfBtn" role="button" >Ver</a>'''

    def buttonEdit(self, obj):

        return '''<a type="button" class="btn btn-admin editBtn" role="button" href="/bill/edit/">Editar</a>'''

    def buttonPays(self, obj):

        return '''<a type="button" class="btn btn-admin paysBtn" role="button" >Pagos</a>'''

    buttonEdit.short_description = 'Editar'
    buttonEdit.allow_tags = True

    buttonPays.short_description = 'Ver Pagos'
    buttonPays.allow_tags = True

    view_btn.short_description = 'Ver'
    view_btn.allow_tags = True

    list_display = ('id', 'view_btn', 'buttonEdit', 'buttonPays', 'bill_date', 'bill_supplier', 'bill_supplier_bill', 'bill_order', 'bill_total')
    search_fields = ('id', 'bill_date', 'bill_supplier__supplier_name', 'bill_supplier_bill', 'bill_order__id')
    filter_horizontal = ('bill_detail_list',)

    class Media:
        js = ("../static/js/admin/bills/button.js",)


@admin.register(BillDetail)
class BillDetailAdmin(admin.ModelAdmin):
    list_display = ('id', 'bill_detail_product', 'bill_detail_product_code', 'bill_detail_description', 'bill_detail_amount',
                  'bill_detail_unit', 'bill_detail_discount', 'bill_detail_iv',  'bill_detail_price',  'bill_detail_total',)
    search_fields = ('id', 'bill_detail_product', 'bill_detail_product_code', 'bill_detail_description', 'bill_detail_amount',
                  'bill_detail_unit', 'bill_detail_discount', 'bill_detail_iv',  'bill_detail_price',  'bill_detail_total',)
#   filter_horizontal = ('',)
