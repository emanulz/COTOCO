# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Product(models.Model):

    product_code = models.IntegerField(verbose_name='Código', unique=True, default=0)
    product_description = models.CharField(max_length=255, verbose_name='Descripción del producto', default='')
    product_avg_price = models.DecimalField(default=0, max_digits=10, decimal_places=2,
                                            verbose_name='Precio promedio ₡')
    product_min_price = models.DecimalField(default=0, max_digits=10, decimal_places=2,
                                            verbose_name='Precio mínimo ₡')

    def __unicode__(self):
        return '%s' % self.product_description

    class Meta:
        verbose_name = 'Producto'
        verbose_name_plural = 'Productos'
        ordering = ['product_code']
