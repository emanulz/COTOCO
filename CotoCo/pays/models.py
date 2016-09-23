# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from bills.models import Bill
from suppliers.models import Supplier

# Create your models here.

class Pay(models.Model):

    pay_date = models.DateField(verbose_name='Fecha')
    pay_details = models.ManyToManyField('PayDetail', blank=True, verbose_name='Detalles de Pago')
    pay_supplier = models.ForeignKey(Supplier, null=True, verbose_name='Proveedor')
    pay_total = models.DecimalField(max_digits=11, blank=True, null=True, decimal_places=2, verbose_name='Total del Pago')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Pago'
        verbose_name_plural = 'Pagos'
        ordering = ['id']

class PayDetail(models.Model):

    pay_detail_bill = models.ForeignKey(Bill, verbose_name='Factura')
    pay_detail_amount = models.DecimalField(max_digits=11, null=True, decimal_places=2, verbose_name='Monto')
    pay_detail_completed = models.BooleanField(default=False, verbose_name='Pago Total?')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Detalle de Pago'
        verbose_name_plural = 'Detalles de Pago'
        ordering = ['id']