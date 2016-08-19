# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-18 00:34
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('clients', '0004_auto_20160807_2011'),
        ('projects', '0004_auto_20160817_1828'),
    ]

    operations = [
        migrations.AddField(
            model_name='project',
            name='project_client',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='clients.Client', verbose_name='Cliente del proyecto'),
            preserve_default=False,
        ),
    ]