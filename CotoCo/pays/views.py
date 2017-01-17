# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from rest_framework import serializers, viewsets
from .models import Pay, PayDetail

from .filters import PayFilter, PayDetailFilter
from suppliers.models import Supplier
from datetime import date

# Create your views here.

@login_required
def pay_create(request):

    return render(request, '../templates/pays/create.jade')

@login_required
def payview(request, pk):

    pay = Pay.objects.get(pk=pk)
    details = PayDetail.objects.filter(pay_detail_pay=pk)

    return render(request, '../templates/pays/payview.jade', {'pay' : pay, 'details': details})


@login_required
def pay_report(request, pk):

    today = date.today()
    supplier = Supplier.objects.get(pk=pk)
    pays = Pay.objects.filter(pay_supplier=pk)

    total = 0
    deposit = 0
    interest = 0

    for pay in pays:

        total = total + pay.pay_total

        if pay.pay_deposit:
            deposit = deposit + pay.pay_deposit
        else:
            deposit = deposit + pay.pay_total

        if pay.pay_interest:
            interest = interest + pay.pay_interest


    return render(request, '../templates/pays/payReport.jade', {'supplier':supplier, 'pays':pays, 'total':total,
                                                                'today':today, 'deposit':deposit, 'interest':interest})


class PaySerializer(serializers.ModelSerializer):

    class Meta:
        model = Pay
        fields = ('id', 'pay_date', 'pay_supplier', 'pay_document_num', 'pay_notes', 'pay_interest', 'pay_total', 'pay_last_debt',
                  'pay_actual_debt', 'pay_deposit', 'pay_exchange_rate', 'pay_dollars')

class PayViewSet(viewsets.ModelViewSet):

    serializer_class = PaySerializer
    queryset = Pay.objects.all()
    lookup_field = 'id'
    filter_class = PayFilter


class PayDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = PayDetail
        fields = ('id', 'pay_detail_pay', 'pay_detail_bill', 'pay_detail_last_debt', 'pay_detail_amount',
                  'pay_detail_actual_debt', 'pay_detail_interest')


class PayDetailViewSet(viewsets.ModelViewSet):

    serializer_class = PayDetailSerializer
    queryset = PayDetail.objects.all()
    lookup_field = 'id'
    filter_class = PayDetailFilter
