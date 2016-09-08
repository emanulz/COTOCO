from __future__ import unicode_literals

from django.contrib import admin
from .models import Request, RequestDetail


@admin.register(Request)
class OrderAdmin(admin.ModelAdmin):

    def buttonPdf(self, obj):

        return '''<a type="button" class="btn btn-admin pdfBtn" role="button" >Ver Pedido</a>'''

    def buttonEdit(self, obj):
        return '''<a type="button" class="btn btn-admin editBtn" role="button" href="/admin/request/edit/">Editar</a>'''

    buttonPdf.short_description = ''
    buttonPdf.allow_tags = True

    buttonEdit.short_description = ''
    buttonEdit.allow_tags = True

    list_display = ('id', 'request_date', 'request_project', 'request_activity', 'buttonPdf', 'buttonEdit')
    search_fields = ('id', 'request_date', 'request_project', 'request_activity')
    filter_horizontal = ('request_product_list',)

    class Media:

        js = ("../static/js/admin/requests/button.js",)


@admin.register(RequestDetail)
class OrderDetailAdmin(admin.ModelAdmin):
    list_display = ('id', 'request_detail_product', 'request_detail_product_code', 'request_detail_description', 'request_detail_amount',)
    search_fields = ('id', 'request_detail_product', 'request_detail_amount',)
#   filter_horizontal = ('',)
