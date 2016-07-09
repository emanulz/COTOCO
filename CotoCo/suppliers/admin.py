# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Supplier


@admin.register(Supplier)
class SupplierAdmin(admin.ModelAdmin):
    list_display = ('id', 'supplier_name', 'supplier_phone', 'supplier_address', 'supplier_email')
    search_fields = ('id', 'supplier_name', 'supplier_phone', 'supplier_address', 'supplier_email')
#   filter_horizontal = ('bill_product_list',)
