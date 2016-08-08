# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Client


@admin.register(Client)
class ClientAdmin(admin.ModelAdmin):
    list_display = ('id', 'client_name', 'client_phone', 'client_id', 'client_address', 'client_email',)
    search_fields = ('id', 'client_name', 'client_phone', 'client_id', 'client_address', 'client_email',)
#   filter_horizontal = ('bill_product_list',)

