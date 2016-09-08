# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from products.models import Product
from activities.models import Activity
from projects.models import Project
# Create your models here.


class Request(models.Model):

    request_date = models.DateField(verbose_name='Fecha')
    request_project = models.ForeignKey(Project, verbose_name='Proyecto')
    request_activity = models.ForeignKey(Activity, verbose_name='Actividad')
    request_product_list = models.ManyToManyField('RequestDetail', verbose_name='Lista de Detalles')


    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Pedido'
        verbose_name_plural = 'Pedidos'
        ordering = ['id']


class RequestDetail(models.Model):

    request_detail_product = models.PositiveIntegerField(verbose_name='Id Producto', null=True, blank=True)
    request_detail_product_code = models.CharField(max_length=255, verbose_name='Código', default='')
    request_detail_description = models.CharField(max_length=255, verbose_name='Descripción', default='')
    request_detail_amount = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='Cantidad')
    request_detail_unit = models.CharField(max_length=255, verbose_name='Unidad', default='')


    def __unicode__(self):
        return '%s' % self.id

    class Meta:
        verbose_name = 'Detalle del pedido'
        verbose_name_plural = 'Detalles de pedidos'
        ordering = ['id']


