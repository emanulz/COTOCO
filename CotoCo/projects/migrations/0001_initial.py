# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-09 15:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('activities', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('project_name', models.CharField(max_length=255, verbose_name='Nombre')),
                ('project_description', models.CharField(max_length=255, verbose_name='Descripci\xf3n')),
                ('project_activity', models.ManyToManyField(to='activities.Activity', verbose_name='Actividades')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Proyecto',
                'verbose_name_plural': 'Proyectos',
            },
        ),
    ]
