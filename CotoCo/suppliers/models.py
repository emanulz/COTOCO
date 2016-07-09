# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Supplier(models.Model):

    supplier_name = models.CharField(max_length=255, verbose_name='Nombre')
    supplier_phone = models.DecimalField(max_digits=11, decimal_places=0, verbose_name='Número de Teléfono')
    supplier_address = models.CharField(max_length=255, verbose_name='Dirección')
    supplier_email = models.EmailField(blank=True, verbose_name='Email')

    def __unicode__(self):
        return '%s' % self.supplier_name

    class Meta:
        verbose_name = 'Proveedor'
        verbose_name_plural = 'Proveedores'
        ordering = ['id']