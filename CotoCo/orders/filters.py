# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Order, OrderDetail


class OrderFilter(django_filters.FilterSet):
    order_min_date = django_filters.DateFilter(name='order_date', lookup_type='gte')
    order_max_date = django_filters.DateFilter(name='order_date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = Order
        fields = ('id', 'order_date', 'order_supplier', 'order_project', 'order_activity', 'order_product_list',
                  'order_total', 'order_min_date', 'order_max_date')


class OrderDetailFilter(django_filters.FilterSet):
    # bil_min_date = django_filters.DateFilter(name='bill_date', lookup_type='gte')
    # bill_max_date = django_filters.DateFilter(name='bill_date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = OrderDetail
        fields = ('id', 'order_detail_product', 'order_detail_product_code', 'order_detail_description', 'order_detail_unit', 'order_detail_price', 'order_detail_amount', 'order_detail_total',)
