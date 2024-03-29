"""
URL configuration for KLC project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi
from KLC_App import views

schema_view = get_schema_view(
    openapi.Info(
        title="KLC API",
        default_version='v1',
        description="APIs for KLC_App",
        contact=openapi.Contact(email="tmd.160301@gmail.com"),
        license=openapi.License(name="Trần Minh Đạo"),
    ),
    public=True,
    permission_classes=(permissions.AllowAny,),
)

urlpatterns = [
    path('', include('KLC_App.urls')),
    path('admin/', admin.site.urls),
    path('o/', include('oauth2_provider.urls', namespace='oauth2_provider')),
    re_path(r'^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    re_path(r'^swagger/$', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    re_path(r'^redoc/$', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),

    path('login/', views.LoginView.as_view(), name='login'),
    path('orders/create/', views.OrderCreateView.as_view(), name='order-create'),
    path('order/create_order_details/', views.OrderDetailCreateView.as_view(), name='order-detail-create'),
    path('purchase-history/', views.PurchaseHistoryView.as_view(), name='purchase-history'),
    #path('', include(router.urls)),
]
