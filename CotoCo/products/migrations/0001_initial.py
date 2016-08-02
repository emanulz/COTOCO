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
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_code', models.IntegerField(default=0, unique=True, verbose_name='C\xf3digo')),
                ('product_description', models.CharField(default='', max_length=255, verbose_name='Descripci\xf3n del producto')),
                ('product_avg_price', models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='Precio sin Impuestos \u20a1')),
                ('product_min_price', models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='Precio sin Impuestos \u20a1')),
            ],
            options={
                'ordering': ['product_code'],
                'verbose_name': 'Producto',
                'verbose_name_plural': 'Productos',
            },
        ),
    ]