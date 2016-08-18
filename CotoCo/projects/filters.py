# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Project


class ProjectFilter(django_filters.FilterSet):
    # min_date = django_filters.DateFilter(name='date', lookup_type='gte')
    # max_date = django_filters.DateFilter(name='date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = Project
        fields = ('id', 'project_name', 'project_description', 'project_client', 'project_activity', 'project_active')