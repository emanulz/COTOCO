# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework import serializers, viewsets
from .models import Supplier
from .filters import SupplierFilter

# Create your views here.

# API


class SupplierSerializer(serializers.ModelSerializer):

    class Meta:
        model = Supplier
        fields = ('id', 'supplier_name', 'supplier_phone', 'supplier_address', 'supplier_email')


class SupplierViewSet(viewsets.ModelViewSet):

    serializer_class = SupplierSerializer
    queryset = Supplier.objects.all()
    lookup_field = 'id'
    filter_class = SupplierFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)