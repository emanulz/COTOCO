# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Request, RequestDetail


class RequestFilter(django_filters.FilterSet):
    request_min_date = django_filters.DateFilter(name='order_date', lookup_type='gte')
    request_max_date = django_filters.DateFilter(name='order_date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = Request
        fields = ('id', 'request_date', 'request_project', 'request_activity', 'request_product_list',
                  'request_min_date', 'request_max_date')


class RequestDetailFilter(django_filters.FilterSet):
    # bil_min_date = django_filters.DateFilter(name='bill_date', lookup_type='gte')
    # bill_max_date = django_filters.DateFilter(name='bill_date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = RequestDetail
        fields = ('id', 'request_detail_product', 'request_detail_product_code', 'request_detail_description',
                  'request_detail_unit', 'request_detail_amount',)
