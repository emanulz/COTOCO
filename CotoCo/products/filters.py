# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Product


class ProductFilter(django_filters.FilterSet):
    # min_date = django_filters.DateFilter(name='date', lookup_type='gte')
    # max_date = django_filters.DateFilter(name='date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = Product
        fields = ('product_code', 'product_description', 'product_avg_price', 'product_min_price',)