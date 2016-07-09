# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from products.models import Product
from suppliers.models import Supplier


class Bill(models.Model):

    bill_date = models.DateField(verbose_name='Fecha')
    bill_supplier = models.ForeignKey(Supplier, verbose_name='Proveedor')
    bill_product_list = models.ManyToManyField('BillDetail', verbose_name='Lista de productos')
    bill_total = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='Precio Total')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Factura'
        verbose_name_plural = 'Facturas'
        ordering = ['id']


class BillDetail(models.Model):

    bill_detail_product = models.ForeignKey(Product, verbose_name='Producto')
    bill_detail_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Precio unitario')
    bill_detail_amount = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='Cantidad')
    bill_detail_total = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='Precio Total')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Detalle de la factura'
        verbose_name_plural = 'Detalles de facturas'
        ordering = ['id']
