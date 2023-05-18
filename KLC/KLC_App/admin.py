from django.contrib import admin
from django.template.response import TemplateResponse
from django.contrib.auth.models import Permission
from .models import Category, Product, User
from django.utils.html import mark_safe
from django.urls import path


class ProductAdmin(admin.ModelAdmin):
    class Media:
        css = {
            'all': ['/static/css/main.css']
        }

    list_display = ["id", "name", "price", "image",  "created_date", "category", "active"]
    search_fields = ["name", "category__name"]
    list_filter = ["category__name"]
    readonly_fields = ["img"]

    def img(self, product):
        return mark_safe("<img src='/static/{img_url}' alt='{alt}' width='150px'/>"
                         .format(img_url=product.image.name, alt=product.name))


class ProductInline(admin.StackedInline):
    model = Product
    pk_name = 'category'


class CategoryAdmin(admin.ModelAdmin):
    inlines = (ProductInline, )


class KLC_AppAdminSite(admin.AdminSite):
    site_header = 'HỆ THỐNG BÁN HÀNG'

    def get_urls(self):
        return [
            path('KLC_stats/', self.KLC_stats)
        ] + super().get_urls()

    def KLC_stats(self, request):
        product_count = Product.objects.count()
        return TemplateResponse(request, 'admin/KLC-stats.html', {
            'product_count': product_count
        })


admin_site = KLC_AppAdminSite('KLC')

# Register your models here.
admin.site.register(Category, CategoryAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(User)
admin.site.register(Permission)
# admin_site.register(Category, CategoryAdmin)
# admin_site.register(Product, ProductAdmin)
