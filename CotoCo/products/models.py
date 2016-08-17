# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Product(models.Model):

    product_code = models.CharField( max_length=7, verbose_name='Código', unique=True, default=0)
    product_department = models.ForeignKey('ProductDepartment', null=True, verbose_name='Familia', default='')
    product_subdepartment = models.ForeignKey('ProductSubDepartment', null=True, verbose_name='Sub-Familia', default='')
    product_consecutive = models.DecimalField(default=0, max_digits=3, decimal_places=0, verbose_name='Consecutivo')
    product_description = models.CharField(max_length=255, verbose_name='Descripción del producto', default='')
    product_price = models.DecimalField(default=0, max_digits=10, decimal_places=2,
                                        verbose_name='Precio ₡')
    product_unit = models.CharField(default='Unidad', max_length=255, verbose_name='Unidad')
    product_usetaxes = models.BooleanField(default=False, verbose_name='Usa Impuestos?')
    product_taxes = models.DecimalField(default=0, max_digits=5, decimal_places=2, verbose_name='Impuestos %')
    product_discount = models.DecimalField(default=0, max_digits=5, decimal_places=2, verbose_name='Descuento %')

    def __unicode__(self):
        return '%s' % self.product_description

    class Meta:
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'
        ordering = ['product_code']


class ProductDepartment(models.Model):

    productdepartment_name = models.CharField(max_length=255, verbose_name='Nombre de la Familia', unique=True)
    productdepartment_code = models.CharField(max_length=2, unique=True, verbose_name='Identificador de Familia')

    def __unicode__(self):
        return '%s' % self.productdepartment_name

    class Meta:
        verbose_name = 'Familia'
        verbose_name_plural = 'Familias'
        ordering = ['productdepartment_code']


class ProductSubDepartment(models.Model):

    productsubdepartment_department = models.ForeignKey('ProductDepartment', verbose_name='Familia')
    productsubdepartment_name = models.CharField(max_length=255, verbose_name='Nombre de la Sub-Familia', unique=True)
    productsubdepartment_code = models.CharField(max_length=2, verbose_name='Identificador de Sub-Familia')

    def __unicode__(self):
        return '%s' % self.productsubdepartment_name

    class Meta:
        verbose_name = 'Sub-Familia'
        verbose_name_plural = 'Sub-Familias'
        ordering = ['id']
