# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.template.loader import get_template
from django.template import RequestContext
from django.http import HttpResponse
from django.shortcuts import render
from .models import Expense
#
from rest_framework import serializers, viewsets
from .filters import ExpenseFilter

# Create your views here.

@login_required
def expenses_create(request):

    return render(request, '../templates/expenses/create.py.jade')

def expenses_edit(request):

    return render(request, '../templates/expenses/edit.py.jade')

def expensepdf2(request, pk):

    expense = Expense.objects.get(pk=pk)
    return render(request, '../templates/expenses/expense.jade', {'expense': expense})

# API


class ExpenseSerializer(serializers.ModelSerializer):

    class Meta:
        model = Expense
        fields = ('id', 'expense_date', 'expense_bill_date', 'expense_supplier', 'expense_project', 'expense_activity',
                  'expense_document', 'expense_description', 'expense_total')


class ExpenseViewSet(viewsets.ModelViewSet):

    serializer_class = ExpenseSerializer
    queryset = Expense.objects.all()
    lookup_field = 'id'
    filter_class = ExpenseFilter
