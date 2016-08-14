# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.http import JsonResponse, Http404, HttpResponse
from django.shortcuts import render
from orders.models import Order, OrderDetail
from bills.models import Bill, BillDetail
from  projects.models import Project


def ordersbyproject(request, project):

    orders = Order.objects.filter(order_project=project)

    subtotal = 0
    iv = 0
    total = 0

    for order in orders:
        subtotal = subtotal+order.order_subtotal
        iv = iv+order.order_iv
        total = total+order.order_total

    # details = orders.order_product_list.all()
    return render(request, '../templates/reports/ordersbyproject.jade', {'orders': orders, 'subtotal':subtotal, 'iv':iv,
                                                                   'total':total})


def billsbyproject(request, project):

    bills = Bill.objects.filter(bill_order__order_project=project)

    subtotal = 0
    iv = 0
    total = 0

    for bill in bills:
        subtotal = subtotal + bill.bill_subtotal
        iv = iv + bill.bill_iv
        total = total + bill.bill_total

    # details = orders.order_product_list.all()
    return render(request, '../templates/reports/billsbyproject.jade', {'bills': bills, 'subtotal': subtotal, 'iv': iv,
                                                                   'total': total})