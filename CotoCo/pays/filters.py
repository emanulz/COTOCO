# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Pay, PayDetail

class PayFilter(django_filters.FilterSet):

       class Meta:
        model = Pay
        fields = ('id', 'pay_date',  'pay_details', 'pay_supplier', 'pay_total',)


class PayDetailFilter(django_filters.FilterSet):
    class Meta:
        model = PayDetail
        fields = ('id', 'pay_detail_bill',  'pay_detail_amount', 'pay_detail_completed',)