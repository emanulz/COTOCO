# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.http import JsonResponse, Http404, HttpResponse
from django.shortcuts import render
from orders.models import Order, OrderDetail
from bills.models import Bill, BillDetail
from projects.models import Project
from suppliers.models import Supplier
from products.models import Product
from activities.models import Activity
from datetime import date

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

def generalreport(request):

    if request.is_ajax():

        type = request.GET['type']
        project = request.GET['project']
        activity = request.GET['activity']
        supplier = request.GET['supplier']
        product = request.GET['product']
        today = date.today()

        projectd= "Todos(as)"
        activityd = "Todos(as)"
        supplierd = "Todos(as)"
        productd = "Todos(as)"

        if type == '1':

            bills = Bill.objects.all()

            if project != '0' :
                bills = bills.filter(bill_order__order_project=project)
                projectobj = Project.objects.get(id=project)
                projectd = '%s - %s' % (projectobj.id, projectobj.project_name)

            if activity != '0':
                bills = bills.filter(bill_order__order_activity=activity)
                activityobj = Activity.objects.get(id=activity)
                activityd = '%s - %s' % (activityobj.id, activityobj.activity_name)

            if supplier != '0':
                bills = bills.filter(bill_supplier=supplier)
                supplierobj = Supplier.objects.get(id=supplier)
                supplierd = '%s ' % supplierobj.supplier_name

            ivbill = 0
            totalbill = 0

            for bill in bills:

                totalbill = totalbill + bill.bill_total
                ivbill = ivbill + bill.bill_iv

            return render(request, '../templates/reports/general_bills.jade', {'bills': bills,'total':totalbill,
                                                                                'iv':ivbill,'project':projectd,
                                                                                'activity':activityd, 'supplier':supplierd,
                                                                                'date':today })

        if type == '2':

            bills = Bill.objects.all()

            if project != '0' :
                bills = bills.filter(bill_order__order_project=project)
                projectobj = Project.objects.get(id=project)
                projectd = '%s - %s' % (projectobj.id, projectobj.project_name)

            if activity != '0':
                bills = bills.filter(bill_order__order_activity=activity)
                activityobj = Activity.objects.get(id=activity)
                activityd = '%s - %s' % (activityobj.id, activityobj.activity_name)

            if supplier != '0':
                bills = bills.filter(bill_supplier=supplier)
                supplierobj = Supplier.objects.get(id=supplier)
                supplierd = '%s ' % supplierobj.supplier_name

            ivbill = 0
            totalbill = 0
            productsbill = 0

            for bill in bills:

                billdetails = bill.bill_detail_list.all()

                for billdetail in billdetails:

                    if product == '0':

                        totalbill = totalbill + billdetail.bill_detail_total
                        ivbill = ivbill + billdetail.bill_detail_iv
                        productsbill = productsbill + billdetail.bill_detail_amount

                    else:
                        if billdetail.bill_detail_product_code == product:

                            productobj = Product.objects.get(product_code=product)
                            productd = '%s - %s' % (product, productobj.product_description)

                            totalbill = totalbill + billdetail.bill_detail_total
                            ivbill = ivbill + billdetail.bill_detail_iv
                            productsbill = productsbill + billdetail.bill_detail_amount

            return render(request, '../templates/reports/detailed_bills.jade', {'bills': bills, 'total':totalbill,
                                                                                'iv':ivbill, 'cantprod':productsbill,
                                                                                'product':product, 'project':projectd,
                                                                                'activity':activityd, 'supplier':supplierd,
                                                                                'productd':productd, 'date':today})

        if type == '3':

            orders = Order.objects.all()

            if project != '0':
                orders = orders.filter(order_project=project)
                projectobj = Project.objects.get(id=project)
                projectd = '%s - %s' % (projectobj.id, projectobj.project_name)

            if activity != '0':
                orders = orders.filter(order_activity=activity)
                activityobj = Activity.objects.get(id=activity)
                activityd = '%s - %s' % (activityobj.id, activityobj.activity_name)

            if supplier != '0':
                orders = orders.filter(order_supplier=supplier)
                supplierobj = Supplier.objects.get(id=supplier)
                supplierd = '%s ' % supplierobj.supplier_name

            ivorder = 0
            totalorder = 0

            for order in orders:
                totalorder = totalorder + order.order_total
                ivorder = ivorder + order.order_iv

            return render(request, '../templates/reports/general_orders.jade', {'orders': orders, 'total': totalorder,
                                                                               'iv': ivorder, 'project': projectd,
                                                                               'activity': activityd,
                                                                               'supplier': supplierd,
                                                                               'date': today})
        if type == '4':

            orders = Order.objects.all()

            if project != '0' :
                orders = orders.filter(order_project=project)
                projectobj = Project.objects.get(id=project)
                projectd = '%s - %s' % (projectobj.id, projectobj.project_name)

            if activity != '0':
                orders = orders.filter(order_activity=activity)
                activityobj = Activity.objects.get(id=activity)
                activityd = '%s - %s' % (activityobj.id, activityobj.activity_name)

            if supplier != '0':
                orders = orders.filter(order_supplier=supplier)
                supplierobj = Supplier.objects.get(id=supplier)
                supplierd = '%s ' % supplierobj.supplier_name

            ivorder = 0
            totalorder = 0
            productsorder = 0

            for order in orders:

                orderdetails = order.order_product_list.all()

                for orderdetail in orderdetails:

                    if product == '0':

                        totalorder = totalorder + orderdetail.order_detail_total
                        ivorder = ivorder + orderdetail.order_detail_iv
                        productsorder = productsorder + orderdetail.order_detail_amount

                    else:
                        if orderdetail.order_detail_product_code == product:

                            productobj = Product.objects.get(product_code=product)
                            productd = '%s - %s' % (product, productobj.product_description)

                            totalorder = totalorder + orderdetail.order_detail_total
                            ivorder = ivorder + orderdetail.order_detail_iv
                            productsorder = productsorder + orderdetail.order_detail_amount

            return render(request, '../templates/reports/detailed_orders.jade', {'orders': orders, 'total':totalorder,
                                                                                'iv':ivorder, 'cantprod':productsorder,
                                                                                'product':product, 'project':projectd,
                                                                                'activity':activityd, 'supplier':supplierd,
                                                                                'productd':productd, 'date':today})

    else:
        return False