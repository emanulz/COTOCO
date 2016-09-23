# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework import serializers, viewsets
from .models import Pay, PayDetail
from .filters import PayFilter, PayDetailFilter

# Create your views here.


class PaySerializer(serializers.ModelSerializer):

    class Meta:
        model = Pay
        fields = ('id', 'pay_date',  'pay_details', 'pay_supplier', 'pay_total',)


class PayViewSet(viewsets.ModelViewSet):

    serializer_class = PaySerializer
    queryset = Pay.objects.all()
    lookup_field = 'id'
    filter_class = PayFilter


class PayDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = PayDetail
        fields = ('id', 'pay_detail_bill',  'pay_detail_amount', 'pay_detail_completed',)


class PayDetailViewSet(viewsets.ModelViewSet):

    serializer_class = PayDetailSerializer
    queryset = PayDetail.objects.all()
    lookup_field = 'id'
    filter_class = PayDetailFilter
