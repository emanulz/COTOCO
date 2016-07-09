# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-07-09 15:53
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Client',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('client_name', models.CharField(max_length=255, verbose_name='Nombre')),
                ('client_phone', models.DecimalField(decimal_places=0, max_digits=11, verbose_name='N\xfamero de Tel\xe9fono')),
                ('client_address', models.CharField(max_length=255, verbose_name='Direcci\xf3n')),
                ('client_email', models.EmailField(blank=True, max_length=254, verbose_name='Email')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Cliente',
                'verbose_name_plural': 'Clientes',
            },
        ),
    ]
