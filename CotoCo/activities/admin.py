# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Activity


@admin.register(Activity)
class ActivityAdmin(admin.ModelAdmin):
    list_display = ('id', 'activity_name', 'activity_description',)
    search_fields = ('id', 'activity_name', 'activity_description',)
#   filter_horizontal = ('',)
