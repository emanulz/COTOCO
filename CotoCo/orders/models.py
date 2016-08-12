# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from products.models import Product
from activities.models import Activity
from suppliers.models import Supplier
from projects.models import Project
# Create your models here.

from django import forms
from django.utils.safestring import mark_safe
from django.template.loader import render_to_string


class Order(models.Model):

    order_date = models.DateField(verbose_name='Fecha')
    order_supplier = models.ForeignKey(Supplier, verbose_name='Proveedor')
    order_project = models.ForeignKey(Project, verbose_name='Proyecto')
    order_activity = models.ForeignKey(Activity, verbose_name='Actividad')
    order_product_list = models.ManyToManyField('OrderDetail', verbose_name='Lista de Detalles')
    order_total = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Precio Total')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Orden'
        verbose_name_plural = 'Ordenes'
        ordering = ['id']


class OrderDetail(models.Model):

    order_detail_product = models.ForeignKey(Product, verbose_name='Id Producto')
    order_detail_product_code = models.CharField(max_length=255, verbose_name='Código', default='')
    order_detail_description = models.CharField(max_length=255, verbose_name='Descripción', default='')
    order_detail_amount = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='Cantidad')
    order_detail_unit = models.CharField(max_length=255, verbose_name='Unidad', default='')
    order_detail_price = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Precio unitario')
    order_detail_total = models.DecimalField(max_digits=11, decimal_places=2, verbose_name='Precio Total')

    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Detalle de la orden'
        verbose_name_plural = 'Detalles de ordenes'
        ordering = ['id']


