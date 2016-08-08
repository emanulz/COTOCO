# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Client


class ClientFilter(django_filters.FilterSet):
    # min_date = django_filters.DateFilter(name='date', lookup_type='gte')
    # max_date = django_filters.DateFilter(name='date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = Client
        fields = ('id', 'client_name', 'client_phone', 'client_id', 'client_address', 'client_email',)
