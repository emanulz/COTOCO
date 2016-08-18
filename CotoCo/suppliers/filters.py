# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Supplier


class SupplierFilter(django_filters.FilterSet):
    # min_date = django_filters.DateFilter(name='date', lookup_type='gte')
    # max_date = django_filters.DateFilter(name='date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = Supplier
        fields = ('id', 'supplier_name', 'supplier_phone', 'supplier_phone2', 'supplier_phone3', 'supplier_address',
                  'supplier_email', 'supplier_email2', 'supplier_email3')