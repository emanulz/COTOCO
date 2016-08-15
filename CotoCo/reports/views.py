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

def byorder(request, order):


    order = Order.objects.get(pk=order)

    bills = Bill.objects.filter(bill_order=order)

    orderdetail = order.order_product_list.all().order_by('order_detail_product_code')

    bill_details = []

    ivbill = 0
    subtotalbill=0
    totalbill = 0

    for bill in bills:

        billdetails = bill.bill_detail_list.all()
        totalbill = totalbill+bill.bill_total
        ivbill = ivbill + bill.bill_iv
        subtotalbill = subtotalbill + bill.bill_subtotal


        for billdetail in billdetails:

            bill_details.append(billdetail)

    difference = totalbill - order.order_total


    return render(request, '../templates/reports/byordersimplified.jade', {'order':order, 'bills': bills,
                                                                           'detail': orderdetail, 'bdetails':bill_details,
                                                                           'ivbill':ivbill, 'subtotalbill':subtotalbill,
                                                                           'totalbill':totalbill, 'difference':difference})