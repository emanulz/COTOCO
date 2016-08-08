# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Product(models.Model):

    product_code = models.IntegerField(primary_key=True, verbose_name='Código', unique=True, default=0)
    product_description = models.CharField(max_length=255, verbose_name='Descripción del producto', default='')
    product_department = models.ForeignKey('ProductDepartment', null=True, verbose_name='Departamento', default='')
    product_price = models.DecimalField(default=0, max_digits=10, decimal_places=2,
                                        verbose_name='Precio ₡')
    product_unit = models.CharField(default='', max_length=255, verbose_name='Unidad')
    product_usetaxes = models.BooleanField(default=False, verbose_name='Usa Impuestos?')
    product_taxes = models.DecimalField(default=0, max_digits=5, decimal_places=2, verbose_name='Impuestos %')

    def __unicode__(self):
        return '%s' % self.product_description

    class Meta:
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'
        ordering = ['product_code']


class ProductDepartment(models.Model):

    productdepartment_name = models.CharField(max_length=255, verbose_name='Nombre del Departamento', unique=True)

    def __unicode__(self):
        return '%s' % self.productdepartment_name

    class Meta:
        verbose_name = 'Departamento'
        verbose_name_plural = 'Departamentos'
        ordering = ['id']
