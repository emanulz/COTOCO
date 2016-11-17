# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from rest_framework import serializers, viewsets
from .models import Bill, BillDetail
from .filters import BillFilter, BillDetailFilter
from pays.models import PayDetail
from suppliers.models import Supplier
from datetime import date

# Create your views here.


@login_required
def bill_create(request):

    return render(request, '../templates/bills/create.jade')

@login_required
def bill_edit(request):

    return render(request, '../templates/bills/edit.jade')

@login_required
def bill_debt_report(request, pk):

    today = date.today()
    supplier = Supplier.objects.get(pk=pk)
    bills = Bill.objects.filter(bill_supplier=pk, bill_payed=False)

    debt = 0

    for bill in bills:

        if bill.bill_debt:
            debt = debt + bill.bill_debt
        else:
            debt = debt + bill.bill_total


    return render(request, '../templates/bills/debtReport.jade', {'supplier':supplier, 'bills':bills, 'debt':debt,
                                                                  'today':today})

def billlist(request):

    array = request.GET['array']
    array = array.replace('[', '')
    array = array.replace(']', '')
    array = array.replace(' ', '')

    array = array.split(',')

    details = []

    for i in array:
        bill = Bill.objects.get(pk=i)
        details.append([i, bill.bill_date, bill.bill_supplier.supplier_name, bill.bill_total])


    return render(request, '../templates/bills/billlist.jade', {'details' : details})


def billview(request):

    billnum = request.GET['bill']

    bill = Bill.objects.get(pk=billnum)

    return render(request, '../templates/bills/billview.jade', {'bill' : bill})

def billpaysview(request):

    billnum = request.GET['bill']

    pays = PayDetail.objects.filter(pay_detail_bill=billnum)

    bill = Bill.objects.get(pk=billnum)

    return render(request, '../templates/bills/billpayview.jade', {'bill' : bill, 'pays':pays})

# API

class BillSerializer(serializers.ModelSerializer):

    class Meta:
        model = Bill
        fields = ('id', 'bill_date', 'bill_supplier', 'bill_supplier_bill', 'bill_order', 'bill_detail_list',
                  'bill_subtotal', 'bill_iv', 'bill_total', 'bill_payed', 'bill_half_payed', 'bill_debt',)


class BillViewSet(viewsets.ModelViewSet):

    serializer_class = BillSerializer
    queryset = Bill.objects.all()
    lookup_field = 'id'
    filter_class = BillFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)


class BillDetailSerializer(serializers.ModelSerializer):

    class Meta:
        model = BillDetail
        fields = ('id', 'bill_detail_product', 'bill_detail_product_code', 'bill_detail_description', 'bill_detail_amount',
                  'bill_detail_unit', 'bill_detail_discount', 'bill_detail_iv',  'bill_detail_price',  'bill_detail_total',)


class BillDetailViewSet(viewsets.ModelViewSet):

    serializer_class = BillDetailSerializer
    queryset = BillDetail.objects.all()
    lookup_field = 'id'
    filter_class = BillDetailFilter
    # filter_fields = ('id','client','nombrecliente','cashier','date','time','totolkilogramos','cantidadarticulos',)