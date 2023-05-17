from django.contrib import admin
from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter
from .admin import admin_site

router = DefaultRouter()
router.register('category', views.CategoryViewSet)
router.register('product', views.ProductViewSet)
router.register('user', views.UserViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls)),
    # /category/ - GET
    # /category/ - POST
    # /category/{category_id}/ - GET
    # /category/{category_id}/ - PUT
    # /category/{category_id}/ - DELETE
    path('', include(router.urls))
    # /product/ - GET
    # /product/ - POST
    # /product/{category_id}/ - GET
    # /product/{category_id}/ - PUT
    # /product/{category_id}/ - DELETE
]