# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from products.models import Product
# Create your models here.


class Order(models.Model):

    order_date = models.DateField(verbose_name='Fecha de la Orden de compra')


class ProductDetailList(models.Model):

    product_detail_product = models.ForeignKey(Product, verbose_name='Producto')
    product_detail_description = models.ForeignKey(Product, verbose_name='Producto')
    product_detail_price = models.DecimalField(max_digits=10, decimal_places=2, verbose_name='Precio unitario')
    product_detail_amount = models.DecimalField(max_digits=7, decimal_places=2, verbose_name='Cantidad')