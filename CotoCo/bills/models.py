# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from products.models import Product
from suppliers.models import Supplier
from orders.models import Order


class Bill(models.Model):

    bill_date = models.DateField(verbose_name='Fecha')
    bill_supplier = models.ForeignKey(Supplier, verbose_name='Proveedor')
    bill_supplier_bill = models.CharField(max_length=255, blank=True, verbose_name='# Factura Proveedor', default='0')
    bill_order = models.ForeignKey(Order, verbose_name='Orden de compra', default=1)
    bill_detail_list = models.ManyToManyField('BillDetail', verbose_name='Lista de detalles')
    bill_subtotal = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Subtotal', default=0)
    bill_iv = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='IV Total', default=0)
    bill_total = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Precio Total')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Factura'
        verbose_name_plural = 'Facturas'
        ordering = ['id']


class BillDetail(models.Model):

    bill_detail_product = models.PositiveIntegerField(verbose_name='Producto', null=True, blank=True)
    bill_detail_product_code = models.CharField(max_length=255, verbose_name='Código', default='')
    bill_detail_description = models.CharField(max_length=255, verbose_name='Descripción', default='')
    bill_detail_amount = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='Cantidad')
    bill_detail_unit = models.CharField(max_length=255, verbose_name='Unidad', default='')
    bill_detail_discount = models.DecimalField(max_digits=4, decimal_places=2, verbose_name='Descuento %', default=0)
    bill_detail_iv = models.DecimalField(max_digits=4, decimal_places=2, verbose_name='IV %', default=0)
    bill_detail_price = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Precio unitario')
    bill_detail_total = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Precio Total')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Detalle de la factura'
        verbose_name_plural = 'Detalles de facturas'
        ordering = ['id']
