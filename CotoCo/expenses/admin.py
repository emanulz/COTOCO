# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.contrib import admin
from .models import Expense


@admin.register(Expense)
class ExpenseAdmin(admin.ModelAdmin):

    def buttonPdf(self, obj):

        return '''<a type="button" class="btn btn-admin pdfBtn" role="button" >Ver</a>'''

    def buttonEdit(self, obj):
        return '''<a type="button" class="btn btn-admin editBtn" role="button" >Editar</a>'''


    buttonPdf.short_description = 'Ver'
    buttonPdf.allow_tags = True

    buttonEdit.short_description = 'Editar'
    buttonEdit.allow_tags = True


    list_display = ('id', 'buttonPdf', 'buttonEdit', 'expense_date', 'expense_bill_date', 'expense_supplier', 'expense_project', 'expense_activity',
                    'expense_total')
    search_fields = ('id', 'expense_date', 'expense_supplier__supplier_name', 'expense_project__project_name', 'expense_activity__activity_name')

    class Media:

        js = ("../static/js/admin/expenses/button.js",)
