# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework import serializers, viewsets
from .models import Product
from .filters import ProductFilter

# Create your views here.

# API


class ProductSerializer(serializers.ModelSerializer):

    class Meta:
        model = Product
        fields = ('product_code', 'product_description', 'product_price', 'product_avg_price', 'product_min_price',)


class ProductViewSet(viewsets.ModelViewSet):

    serializer_class = ProductSerializer
    queryset = Product.objects.all()
    lookup_field = 'product_code'
    filter_class = ProductFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)
