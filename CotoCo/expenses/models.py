# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from activities.models import Activity
from suppliers.models import Supplier
from projects.models import Project


class Expense(models.Model):

    expense_date = models.DateField(verbose_name='Fecha')
    expense_bill_date = models.DateField(verbose_name='Fecha de Factura', null=True, blank=True)
    expense_supplier = models.ForeignKey(Supplier, verbose_name='Proveedor')
    expense_project = models.ForeignKey(Project, verbose_name='Proyecto')
    expense_activity = models.ForeignKey(Activity, verbose_name='Actividad')
    expense_description = models.CharField(max_length=255, verbose_name='Detalle')
    expense_document = models.CharField(max_length=255, verbose_name='Documento')
    expense_total = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Precio Total')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Gasto'
        verbose_name_plural = 'Gastos'
        ordering = ['id']
