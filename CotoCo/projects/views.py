# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from rest_framework import serializers, viewsets
from .models import Project
from .filters import ProjectFilter

# Create your views here.

# API


class ProjectSerializer(serializers.ModelSerializer):

    class Meta:
        model = Project
        fields = ('id', 'project_name', 'project_description', 'project_client', 'project_activity', 'project_active')


class ProjectViewSet(viewsets.ModelViewSet):

    serializer_class = ProjectSerializer
    queryset = Project.objects.all()
    lookup_field = 'id'
    filter_class = ProjectFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)
