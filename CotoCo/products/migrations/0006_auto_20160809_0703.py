# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-09 13:03
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0005_auto_20160807_2005'),
    ]

    operations = [
        migrations.CreateModel(
            name='ProductSubDepartment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('productsubdepartment_name', models.CharField(max_length=255, unique=True, verbose_name='Nombre de la Sub-Familia')),
                ('productsubdepartment_code', models.DecimalField(decimal_places=0, default=0, max_digits=2, verbose_name='Identificador de Sub-Familia')),
                ('productsubdepartment_consecutive', models.DecimalField(decimal_places=0, default=1, max_digits=6, verbose_name='Consecutivo')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Familia',
                'verbose_name_plural': 'Familias',
            },
        ),
        migrations.AlterModelOptions(
            name='productdepartment',
            options={'ordering': ['productdepartment_code'], 'verbose_name': 'Familia', 'verbose_name_plural': 'Familias'},
        ),
        migrations.AddField(
            model_name='productdepartment',
            name='productdepartment_code',
            field=models.DecimalField(decimal_places=0, default=0, max_digits=2, verbose_name='Identificador de Familia'),
        ),
        migrations.AddField(
            model_name='productdepartment',
            name='productdepartment_consecutive',
            field=models.DecimalField(decimal_places=0, default=1, max_digits=6, verbose_name='Consecutivo'),
        ),
        migrations.AlterField(
            model_name='productdepartment',
            name='productdepartment_name',
            field=models.CharField(max_length=255, unique=True, verbose_name='Nombre de la Familia'),
        ),
        migrations.AddField(
            model_name='productsubdepartment',
            name='productsubdepartment_department',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.ProductDepartment', verbose_name='Familia'),
        ),
    ]