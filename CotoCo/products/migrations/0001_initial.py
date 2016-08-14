# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-12 03:35
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('product_code', models.CharField(default=0, max_length=7, unique=True, verbose_name='C\xf3digo')),
                ('product_consecutive', models.DecimalField(decimal_places=0, default=0, max_digits=3, verbose_name='Consecutivo')),
                ('product_description', models.CharField(default='', max_length=255, verbose_name='Descripci\xf3n del producto')),
                ('product_price', models.DecimalField(decimal_places=2, default=0, max_digits=10, verbose_name='Precio \u20a1')),
                ('product_unit', models.CharField(default='Unidad', max_length=255, verbose_name='Unidad')),
                ('product_usetaxes', models.BooleanField(default=False, verbose_name='Usa Impuestos?')),
                ('product_taxes', models.DecimalField(decimal_places=2, default=0, max_digits=5, verbose_name='Impuestos %')),
            ],
            options={
                'ordering': ['product_code'],
                'verbose_name': 'Producto',
                'verbose_name_plural': 'Productos',
            },
        ),
        migrations.CreateModel(
            name='ProductDepartment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('productdepartment_name', models.CharField(max_length=255, unique=True, verbose_name='Nombre de la Familia')),
                ('productdepartment_code', models.CharField(max_length=2, unique=True, verbose_name='Identificador de Familia')),
            ],
            options={
                'ordering': ['productdepartment_code'],
                'verbose_name': 'Familia',
                'verbose_name_plural': 'Familias',
            },
        ),
        migrations.CreateModel(
            name='ProductSubDepartment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('productsubdepartment_name', models.CharField(max_length=255, unique=True, verbose_name='Nombre de la Sub-Familia')),
                ('productsubdepartment_code', models.CharField(max_length=2, verbose_name='Identificador de Sub-Familia')),
                ('productsubdepartment_department', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.ProductDepartment', verbose_name='Familia')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Sub-Familia',
                'verbose_name_plural': 'Sub-Familias',
            },
        ),
        migrations.AddField(
            model_name='product',
            name='product_department',
            field=models.ForeignKey(default='', null=True, on_delete=django.db.models.deletion.CASCADE, to='products.ProductDepartment', verbose_name='Familia'),
        ),
        migrations.AddField(
            model_name='product',
            name='product_subdepartment',
            field=models.ForeignKey(default='', null=True, on_delete=django.db.models.deletion.CASCADE, to='products.ProductSubDepartment', verbose_name='Sub-Familia'),
        ),
    ]