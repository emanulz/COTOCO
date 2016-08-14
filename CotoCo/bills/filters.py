# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Bill, BillDetail


class BillFilter(django_filters.FilterSet):
    bill_min_date = django_filters.DateFilter(name='bill_date', lookup_type='gte')
    bill_max_date = django_filters.DateFilter(name='bill_date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = Bill
        fields = ('id', 'bill_date', 'bill_supplier', 'bill_order', 'bill_detail_list', 'bill_subtotal', 'bill_iv',
                  'bill_total', 'bill_min_date', 'bill_max_date')


class BillDetailFilter(django_filters.FilterSet):
    # bil_min_date = django_filters.DateFilter(name='bill_date', lookup_type='gte')
    # bill_max_date = django_filters.DateFilter(name='bill_date', lookup_type='lte')
    # product_code=django_filters.CharFilter(lookup_type='icontains')

    class Meta:
        model = BillDetail
        fields = ('id', 'bill_detail_product', 'bill_detail_product_code', 'bill_detail_description', 'bill_detail_amount',
                  'bill_detail_unit', 'bill_detail_discount', 'bill_detail_iv',  'bill_detail_price',  'bill_detail_total',)
