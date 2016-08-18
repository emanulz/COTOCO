# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models


class Activity(models.Model):
    activity_name = models.CharField(max_length=255, verbose_name='Nombre')
    activity_description = models.CharField(blank=True, max_length=255, verbose_name='Descripción', default='')

    def __unicode__(self):
        return '%s' % self.activity_name

    class Meta:
        verbose_name = 'Actividad'
        verbose_name_plural = 'Actividades'
        ordering = ['id']

