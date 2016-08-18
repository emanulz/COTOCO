# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Project


@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    list_display = ('id', 'project_name', 'project_description', 'project_client', 'project_active')
    search_fields = ('id', 'project_name', 'project_description', 'project_client__client_name')
    filter_horizontal = ('project_activity',)
