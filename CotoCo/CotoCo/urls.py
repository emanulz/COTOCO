"""CotoCo URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add an import:  from blog import urls as blog_urls
    2. Add a URL to urlpatterns:  url(r'^blog/', include(blog_urls))
"""
from django.conf.urls import include, url
from django.contrib import admin
from rest_framework import routers

from frontend.views import LandingView

from activities.views import ActivityViewSet
from bills.views import BillViewSet, BillDetailViewSet
from clients.views import ClientViewSet
from orders.views import OrderViewSet, OrderDetailViewSet, order2pdf, orderpdf2
from products.views import ProductViewSet, ProductDepartmentViewSet
from projects.views import ProjectViewSet
from suppliers.views import SupplierViewSet
from frontend.views import LandingView

from django.conf import settings
from django.contrib.staticfiles import views

router = routers.DefaultRouter()
router.register(r'activities', ActivityViewSet)
router.register(r'bills', BillViewSet)
router.register(r'bill_detail', BillDetailViewSet)
router.register(r'clients', ClientViewSet)
router.register(r'order_detail', OrderDetailViewSet)
router.register(r'orders', OrderViewSet)
router.register(r'order_detail', OrderDetailViewSet)
router.register(r'products', ProductViewSet)
router.register(r'product_departments', ProductDepartmentViewSet)
router.register(r'projects', ProjectViewSet)
router.register(r'suppliers', SupplierViewSet)


urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'orderpdf/(?P<pk>\d+)/$', order2pdf, name='order2pdf'),
    url(r'orderpdf2/(?P<pk>\d+)/$', orderpdf2, name='orderpdf2'),
    url(r'^api/', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^', LandingView),
]

if settings.DEBUG:
    urlpatterns += [
        url(r'^static/(?P<path>.*)$', views.serve),
    ]