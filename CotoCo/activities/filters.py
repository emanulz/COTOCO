# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Activity


class ActivityFilter(django_filters.FilterSet):
    # min_date = django_filters.DateFilter(name='date', lookup_type='gte')
    # max_date = django_filters.DateFilter(name='date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = Activity
        fields = ('id', 'activity_name', 'activity_description',)
