# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Pay, PayDetail

class PayFilter(django_filters.FilterSet):

       class Meta:
        model = Pay
        fields = ('id', 'pay_date', 'pay_supplier', 'pay_document_num', 'pay_notes', 'pay_interest', 'pay_total', 'pay_last_debt',
                  'pay_actual_debt', 'pay_deposit', 'pay_exchange_rate', 'pay_dollars' )


class PayDetailFilter(django_filters.FilterSet):
    class Meta:
        model = PayDetail
        fields = ('id', 'pay_detail_pay', 'pay_detail_bill', 'pay_detail_last_debt', 'pay_detail_amount',
                  'pay_detail_actual_debt', 'pay_detail_interest',)