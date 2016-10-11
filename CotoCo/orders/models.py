# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from products.models import Product
from activities.models import Activity
from suppliers.models import Supplier
from projects.models import Project
from requests.models import Request
# Create your models here.

class Order(models.Model):

    order_date = models.DateField(verbose_name='Fecha')
    order_deliver_date = models.DateField(verbose_name='Fecha de entrega', null=True, blank=True)
    order_supplier = models.ForeignKey(Supplier, verbose_name='Proveedor')
    order_project = models.ForeignKey(Project, verbose_name='Proyecto')
    order_activity = models.ForeignKey(Activity, verbose_name='Actividad')
    order_request = models.ForeignKey(Request, null=True, blank=True, verbose_name='Pedido')
    order_product_list = models.ManyToManyField('OrderDetail', verbose_name='Lista de Detalles')
    order_subtotal = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Subtotal', default=0)
    order_iv = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='IV Total', default=0)
    order_total = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Precio Total')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Orden'
        verbose_name_plural = 'Ordenes'
        ordering = ['id']


class OrderDetail(models.Model):

    order_detail_product = models.PositiveIntegerField(verbose_name='Id Producto', null=True, blank=True)
    order_detail_product_code = models.CharField(max_length=255, verbose_name='Código', default='')
    order_detail_description = models.CharField(max_length=255, verbose_name='Descripción', default='')
    order_detail_amount = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='Cantidad')
    order_detail_unit = models.CharField(max_length=255, verbose_name='Unidad', default='')
    order_detail_discount = models.DecimalField(max_digits=4, decimal_places=2, verbose_name='Descuento %', default=0)
    order_detail_iv = models.DecimalField(max_digits=4, decimal_places=2, verbose_name='IV %', default=0)
    order_detail_price = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Precio unitario')
    order_detail_total = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Precio Total')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Detalle de la orden'
        verbose_name_plural = 'Detalles de ordenes'
        ordering = ['id']


