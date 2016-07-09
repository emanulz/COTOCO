# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework import serializers, viewsets
from .models import Activity
from .filters import ActivityFilter

# Create your views here.

# API


class ActivitySerializer(serializers.ModelSerializer):

    class Meta:
        model = Activity
        fields = ('id', 'activity_name', 'activity_description',)


class ActivityViewSet(viewsets.ModelViewSet):

    serializer_class = ActivitySerializer
    queryset = Activity.objects.all()
    lookup_field = 'id'
    filter_class = ActivityFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)

