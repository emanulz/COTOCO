# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Client(models.Model):

    client_name = models.CharField(max_length=255, verbose_name='Nombre')
    client_phone = models.DecimalField(max_digits=11, decimal_places=0, blank=True, verbose_name='Número de Teléfono')
    client_id = models.DecimalField(max_digits=20, decimal_places=0, default=0, blank=True,
                                    verbose_name='Identificación')
    client_address = models.CharField(max_length=255, verbose_name='Dirección', blank=True, default='')
    client_email = models.EmailField(blank=True, verbose_name='Email')

    def __unicode__(self):
        return '%s' % self.client_name

    class Meta:
        verbose_name = 'Cliente'
        verbose_name_plural = 'Clientes'
        ordering = ['id']
