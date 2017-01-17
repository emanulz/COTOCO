# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django_filters
from .models import Expense


class ExpenseFilter(django_filters.FilterSet):
    expense_min_date = django_filters.DateFilter(name='expense_date', lookup_type='gte')
    expense_max_date = django_filters.DateFilter(name='expense_date', lookup_type='lte')

    class Meta:
        model = Expense
        fields = ('id', 'expense_date', 'expense_bill_date', 'expense_supplier', 'expense_project', 'expense_activity',
                  'expense_document', 'expense_description', 'expense_total', 'expense_min_date',
                  'expense_max_date')