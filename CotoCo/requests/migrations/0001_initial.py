# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-28 16:12
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('activities', '0002_auto_20160817_1828'),
        ('products', '0003_auto_20160817_1818'),
        ('projects', '0005_project_project_client'),
    ]

    operations = [
        migrations.CreateModel(
            name='Request',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('request_date', models.DateField(verbose_name='Fecha')),
                ('request_activity', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='activities.Activity', verbose_name='Actividad')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Pedido',
                'verbose_name_plural': 'Pedidos',
            },
        ),
        migrations.CreateModel(
            name='RequestDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('request_detail_product_code', models.CharField(default='', max_length=255, verbose_name='C\xf3digo')),
                ('request_detail_description', models.CharField(default='', max_length=255, verbose_name='Descripci\xf3n')),
                ('request_detail_amount', models.DecimalField(decimal_places=2, max_digits=7, verbose_name='Cantidad')),
                ('request_detail_unit', models.CharField(default='', max_length=255, verbose_name='Unidad')),
                ('request_detail_product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Product', verbose_name='Id Producto')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Detalle del pedido',
                'verbose_name_plural': 'Detalles de pedidos',
            },
        ),
        migrations.AddField(
            model_name='request',
            name='request_product_list',
            field=models.ManyToManyField(to='requests.RequestDetail', verbose_name='Lista de Detalles'),
        ),
        migrations.AddField(
            model_name='request',
            name='request_project',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='projects.Project', verbose_name='Proyecto'),
        ),
    ]