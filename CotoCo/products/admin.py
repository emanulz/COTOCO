# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Product, ProductDepartment


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('product_code', 'product_description', 'product_department', 'product_price', 'product_unit',
                    'product_usetaxes', 'product_taxes')
    search_fields = ('id', 'product_code', 'product_description', 'product_department', 'product_price', 'product_unit',
                     'product_usetaxes', 'product_taxes')
#   filter_horizontal = ('bill_product_list',)


@admin.register(ProductDepartment)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('productdepartment_name', )
    search_fields = ('id', 'productdepartment_name',)
