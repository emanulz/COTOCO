# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from activities.models import Activity


class Project(models.Model):
    project_name = models.CharField(max_length=255, verbose_name='Nombre')
    project_description = models.CharField(max_length=255, verbose_name='Descripción')
    project_activity = models.ManyToManyField(Activity, verbose_name='Actividades', blank=True)

    def __unicode__(self):
        return '%s' % self.project_name

    class Meta:
        verbose_name = 'Proyecto'
        verbose_name_plural = 'Proyectos'
        ordering = ['id']
