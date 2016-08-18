# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Supplier


@admin.register(Supplier)
class SupplierAdmin(admin.ModelAdmin):
    list_display = ('id', 'supplier_name', 'supplier_phone', 'supplier_phone2', 'supplier_phone3', 'supplier_address',
                    'supplier_email', 'supplier_email2', 'supplier_email3')
    search_fields = ('id', 'supplier_name', 'supplier_phone', 'supplier_phone2', 'supplier_phone3', 'supplier_address',
                    'supplier_email', 'supplier_email2', 'supplier_email3')
#   filter_horizontal = ('bill_product_list',)
