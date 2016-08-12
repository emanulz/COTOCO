# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Product, ProductDepartment, ProductSubDepartment


class ProductFilter(django_filters.FilterSet):
    # min_date = django_filters.DateFilter(name='date', lookup_type='gte')
    # max_date = django_filters.DateFilter(name='date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = Product
        fields = ('id', 'product_code', 'product_consecutive', 'product_description', 'product_department', 'product_price',
                  'product_unit', 'product_usetaxes', 'product_taxes')


class ProductDepartmentFilter(django_filters.FilterSet):
    # min_date = django_filters.DateFilter(name='date', lookup_type='gte')
    # max_date = django_filters.DateFilter(name='date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = ProductDepartment
        fields = ('id', 'productdepartment_code', 'productdepartment_name')


class ProductSubDepartmentFilter(django_filters.FilterSet):
    # min_date = django_filters.DateFilter(name='date', lookup_type='gte')
    # max_date = django_filters.DateFilter(name='date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = ProductSubDepartment
        fields = ('id', 'productsubdepartment_code', 'productsubdepartment_name', 'productsubdepartment_department',)
