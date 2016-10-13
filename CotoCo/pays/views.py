# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from rest_framework import serializers, viewsets
from .models import Pay, PayDetail
from .filters import PayFilter, PayDetailFilter

# Create your views here.

@login_required
def pay_create(request):

    return render(request, '../templates/pays/create.jade')

@login_required
def payview(request, pk):

    pay = Pay.objects.get(pk=pk)
    details = PayDetail.objects.filter(pay_detail_pay=pk)

    return render(request, '../templates/pays/payview.jade', {'pay' : pay, 'details': details})


class PaySerializer(serializers.ModelSerializer):

    class Meta:
        model = Pay
        fields = ('id', 'pay_date', 'pay_supplier', 'pay_document_num', 'pay_notes', 'pay_total', 'pay_last_debt',
                  'pay_actual_debt', )

class PayViewSet(viewsets.ModelViewSet):

    serializer_class = PaySerializer
    queryset = Pay.objects.all()
    lookup_field = 'id'
    filter_class = PayFilter


class PayDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = PayDetail
        fields = ('id', 'pay_detail_pay', 'pay_detail_bill', 'pay_detail_last_debt', 'pay_detail_amount',
                  'pay_detail_actual_debt',)


class PayDetailViewSet(viewsets.ModelViewSet):

    serializer_class = PayDetailSerializer
    queryset = PayDetail.objects.all()
    lookup_field = 'id'
    filter_class = PayDetailFilter
