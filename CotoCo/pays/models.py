# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from bills.models import Bill
from suppliers.models import Supplier

# Create your models here.

class Pay(models.Model):

    pay_date = models.DateField(verbose_name='Fecha')
    pay_supplier = models.ForeignKey(Supplier, null=True, verbose_name='Proveedor')
    pay_document_num = models.CharField(max_length=100, null=True, verbose_name='Comprobante Número')
    pay_notes = models.CharField(max_length=255, blank=True, null=True, verbose_name='Notas')
    pay_interest = models.DecimalField(max_digits=11, blank=True, null=True, decimal_places=2,
                                    verbose_name='Total de intereses')
    pay_total = models.DecimalField(max_digits=11, blank=True, null=True, decimal_places=2,
                                    verbose_name='Total del Pago')
    pay_deposit = models.DecimalField(max_digits=11, blank=True, null=True, decimal_places=2,
                                    verbose_name='Total del Depósito')
    pay_last_debt = models.DecimalField(max_digits=11, blank=True, null=True, decimal_places=2,
                                        verbose_name='Saldo Total Anterior')
    pay_actual_debt = models.DecimalField(max_digits=11, blank=True, null=True, decimal_places=2,
                                          verbose_name='Saldo Total Actual')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Pago'
        verbose_name_plural = 'Pagos'
        ordering = ['id']

class PayDetail(models.Model):

    pay_detail_pay = models.ForeignKey('Pay', verbose_name='Pago')
    pay_detail_bill = models.ForeignKey( Bill, verbose_name='Factura')
    pay_detail_last_debt = models.DecimalField(max_digits=11, null=True, decimal_places=2, verbose_name='Saldo Anterior')
    pay_detail_amount = models.DecimalField(max_digits=11, null=True, decimal_places=2, verbose_name='Monto')
    pay_detail_actual_debt = models.DecimalField(max_digits=11, null=True, decimal_places=2, verbose_name='Saldo Actual')
    pay_detail_interest = models.DecimalField(max_digits=11, null=True, decimal_places=2, verbose_name='Interés')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Detalle de Pago'
        verbose_name_plural = 'Detalles de Pago'
        ordering = ['id']