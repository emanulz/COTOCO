# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.http import JsonResponse, Http404, HttpResponse
from django.shortcuts import render
from orders.models import Order, OrderDetail
from bills.models import Bill, BillDetail
from requests.models import Request, RequestDetail
from projects.models import Project
from suppliers.models import Supplier
from products.models import Product
from activities.models import Activity
from datetime import date
from operator import itemgetter

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

        bills = Bill.objects.all()

        if project != '0':
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

        orders = Order.objects.all()

        requests = Request.objects.all()


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

        if type == '1':



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

            ivbill = 0
            totalbill = 0
            productsbill = 0

            for bill in bills:

                billdetails = bill.bill_detail_list.all()

                if product == '0':
                    ivbill = ivbill + bill.bill_iv

                for billdetail in billdetails:

                    if product == '0':

                        totalbill = totalbill + billdetail.bill_detail_total
                        productsbill = productsbill + billdetail.bill_detail_amount

                    else:
                        if billdetail.bill_detail_product_code == product:

                            productobj = Product.objects.get(product_code=product)
                            productd = '%s - %s' % (product, productobj.product_description)

                            totalbill = totalbill + billdetail.bill_detail_total
                            ivbill = ivbill + ((billdetail.bill_detail_iv/100)*billdetail.bill_detail_total)
                            productsbill = productsbill + billdetail.bill_detail_amount

            return render(request, '../templates/reports/detailed_bills.jade', {'bills': bills, 'subtotal':totalbill,
                                                                                'total': totalbill+ivbill,
                                                                                'iv':ivbill, 'cantprod':productsbill,
                                                                                'product':product, 'project':projectd,
                                                                                'activity':activityd, 'supplier':supplierd,
                                                                                'productd':productd, 'date':today})
        if type == '3':

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

            ivorder = 0
            totalorder = 0
            productsorder = 0


            for order in orders:

                orderdetails = order.order_product_list.all()

                if product == '0':
                    ivorder = ivorder + order.order_iv

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
                            ivorder = ivorder + ((orderdetail.order_detail_iv / 100) * orderdetail.order_detail_total)
                            productsorder = productsorder + orderdetail.order_detail_amount

            return render(request, '../templates/reports/detailed_orders.jade', {'orders': orders, 'subtotal':totalorder,
                                                                                'total': totalorder+ivorder,
                                                                                'iv':ivorder, 'cantprod':productsorder,
                                                                                'product':product, 'project':projectd,
                                                                                'activity':activityd, 'supplier':supplierd,
                                                                                'productd':productd, 'date':today})

        if type == '5':

            details_array=[]

            for order in orders:

                order_detail = order.order_product_list.all()

                for detail in order_detail:

                    i = 0

                    for list_ in details_array:
                        if detail.order_detail_product_code in list_:
                            break
                        i += 1

                    if len(details_array) == i:

                        details_array.append([detail.order_detail_product_code, detail.order_detail_description, 0,detail.order_detail_amount, 0,0,0,0,[order.id],[],[]])

                    else:
                        details_array[i][3]=details_array[i][3]+detail.order_detail_amount
                        details_array[i][8].append(order.id)

            for bill in bills:

                bill_detail = bill.bill_detail_list.all()

                for detail in bill_detail:

                    i = 0

                    for list_ in details_array:
                        if detail.bill_detail_product_code in list_:
                            break
                        i += 1

                    if len(details_array) == i:

                        details_array.append([detail.bill_detail_product_code, detail.bill_detail_description, 0,0, detail.bill_detail_amount,0,0,0,[],[bill.id],[]])

                    else:
                        details_array[i][4]=details_array[i][4]+detail.bill_detail_amount
                        details_array[i][9].append(bill.id)

            for request2 in requests:

                request_detail = request2.request_product_list.all()

                for detail in request_detail:

                    i = 0

                    for list_ in details_array:
                        if detail.request_detail_product_code in list_:
                            break
                        i += 1

                    if len(details_array) == i:

                        details_array.append([detail.request_detail_product_code, detail.request_detail_description, detail.request_detail_amount,0, 0,0,0,0,[],[],[request2.id]])

                    else:
                        details_array[i][2]=details_array[i][2]+detail.request_detail_amount
                        details_array[i][10].append(request2.id)


            details_array = sorted(details_array, key=itemgetter(0))

            return render(request, '../templates/reports/general_byproduct.jade', {'array': details_array,
                                                                                'product': product, 'project': projectd,
                                                                                'activity': activityd,
                                                                                'supplier': supplierd,
                                                                                'productd': productd, 'date': today})


    else:
        return False