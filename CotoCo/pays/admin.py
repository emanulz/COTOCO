from django.contrib import admin
from .models import Pay, PayDetail
# Register your models here.


@admin.register(Pay)
class PayAdmin(admin.ModelAdmin):

    def buttonPdf(self, obj):
        return '''<a type="button" class="btn btn-admin pdfBtn" role="button" >Ver</a>'''

    buttonPdf.short_description = 'Ver'
    buttonPdf.allow_tags = True

    list_display = ('id', 'buttonPdf', 'pay_date', 'pay_supplier', 'pay_document_num', 'pay_notes', 'pay_total',)

    search_fields = ('id', 'pay_date',  'pay_supplier__supplier_name', 'pay_total', 'pay_document_num',)

    class Media:

        js = ("../static/js/admin/pays/button.js",)


@admin.register(PayDetail)
class PayDetailAdmin(admin.ModelAdmin):

    list_display = ('id', 'pay_detail_pay', 'pay_detail_bill', 'pay_detail_amount', 'pay_detail_interest' )
    search_fields = ('id', 'pay_detail_bill__id',  'pay_detail_amount', 'pay_detail_interest')
