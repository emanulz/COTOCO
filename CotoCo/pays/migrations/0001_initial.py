# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-09-23 15:11
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('bills', '0009_auto_20160922_1937'),
        ('suppliers', '0003_auto_20160818_1843'),
    ]

    operations = [
        migrations.CreateModel(
            name='Pay',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pay_date', models.DateField(verbose_name='Fecha')),
                ('pay_total', models.DecimalField(blank=True, decimal_places=2, max_digits=11, null=True, verbose_name='Total del Pago')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Pago',
                'verbose_name_plural': 'Pagos',
            },
        ),
        migrations.CreateModel(
            name='PayDetail',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('pay_detail_amount', models.DecimalField(decimal_places=2, max_digits=11, null=True, verbose_name='Monto')),
                ('pay_detail_completed', models.BooleanField(default=False, verbose_name='Pago Total?')),
                ('pay_detail_bill', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='bills.Bill', verbose_name='Factura')),
            ],
            options={
                'ordering': ['id'],
                'verbose_name': 'Detalle de Pago',
                'verbose_name_plural': 'Detalles de Pago',
            },
        ),
        migrations.AddField(
            model_name='pay',
            name='pay_details',
            field=models.ManyToManyField(blank=True, null=True, to='pays.PayDetail', verbose_name='Detalles de Pago'),
        ),
        migrations.AddField(
            model_name='pay',
            name='pay_supplier',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='suppliers.Supplier', verbose_name='Proveedor'),
        ),
    ]
