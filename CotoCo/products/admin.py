# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Product


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('product_code', 'product_description', 'product_avg_price', 'product_min_price',)
    search_fields = ('id', 'client_name', 'client_phone', 'client_address', 'client_email',)
#   filter_horizontal = ('bill_product_list',)
