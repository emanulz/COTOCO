# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-18 00:28
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('projects', '0003_project_project_active'),
    ]

    operations = [
        migrations.AlterField(
            model_name='project',
            name='project_description',
            field=models.CharField(blank=True, default='', max_length=255, verbose_name='Descripci\xf3n'),
        ),
    ]