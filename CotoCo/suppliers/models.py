# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Supplier(models.Model):

    supplier_name = models.CharField(max_length=255, verbose_name='Nombre')
    supplier_address = models.CharField(blank=True,max_length=255, verbose_name='Dirección', default='')
    supplier_phone = models.DecimalField(blank=True,max_digits=15, decimal_places=0, verbose_name='Teléfono Ventas', default=0)
    supplier_phone2 = models.DecimalField(blank=True,max_digits=15, decimal_places=0, verbose_name='Teléfono Contabilidad', default=0)
    supplier_phone3 = models.DecimalField(blank=True,max_digits=15, decimal_places=0, verbose_name='Teléfono Administración', default=0)
    supplier_email = models.EmailField(blank=True, null=True, verbose_name='Email Ventas')
    supplier_email2 = models.EmailField(blank=True, null=True, verbose_name='Email Contabilidad')
    supplier_email3 = models.EmailField(blank=True, null=True, verbose_name='Email Administración')

    def __unicode__(self):
        return '%s' % self.supplier_name

    class Meta:
        verbose_name = 'Proveedor'
        verbose_name_plural = 'Proveedores'
        ordering = ['id']