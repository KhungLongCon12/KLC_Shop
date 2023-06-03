from django.contrib import admin
from django.urls import path, include
from . import views
from rest_framework.routers import DefaultRouter
from .admin import admin_site

router = DefaultRouter()
router.register('category', views.CategoryViewSet)
router.register('product', views.ProductViewSet)
router.register('register', views.UserViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls)),
]
