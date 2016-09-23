from django.contrib import admin
from .models import Pay, PayDetail
# Register your models here.


@admin.register(Pay)
class PayAdmin(admin.ModelAdmin):

    list_display = ('id', 'pay_date',  'pay_supplier', 'pay_total',)
    search_fields = ('id', 'pay_date',  'pay_supplier', 'pay_total',)
    filter_horizontal = ('pay_details',)

@admin.register(PayDetail)
class PayDetailAdmin(admin.ModelAdmin):

    list_display = ('id', 'pay_detail_bill',  'pay_detail_amount', 'pay_detail_completed',)
    search_fields = ('id', 'pay_detail_bill__id',  'pay_detail_amount', 'pay_detail_completed',)
