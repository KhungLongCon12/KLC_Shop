from django.db import models
from django.contrib.auth.models import AbstractUser


class BaseModel(models.Model):
    created_date = models.DateTimeField(auto_now_add=True)
    updated_date = models.DateTimeField(auto_now=True)
    active = models.BooleanField(default=True)

    class Meta:
        abstract = True


class Role(BaseModel):
    name = models.CharField(max_length=50)

    class Meta:
        db_table = "role"

    def __str__(self):
        return self.name


class User(AbstractUser):
    avatar = models.ImageField(upload_to='user/')


class Category(BaseModel):
    name = models.CharField(max_length=100, null=False, unique=True)

    class Meta:
        ordering = ('name',)
        db_table = 'category'

    def __str__(self):
        return self.name


class Product(BaseModel):
    name = models.CharField(max_length=100, null=False)
    description = models.TextField(null=True, blank=True)
    price = models.IntegerField(null=False)
    image = models.ImageField(upload_to='products/', blank=True, null=True)
    thumbnail = models.ImageField(upload_to='products/', blank=True, null=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=False)

    class Meta:
        ordering = ('-created_date',)
        db_table = 'product'

    def __str__(self):
        return self.name


class Order(BaseModel):
    account = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length=100, null=False)
    address = models.CharField(max_length=100, null=False)
    phone = models.CharField(max_length=100)
    paid_amount = models.IntegerField(null=False)

    class Meta:
        db_table = 'order'
        ordering = ['-created_date', ]

    def __str__(self):
        return str(self.id)


class OrderProduct(BaseModel):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    price = models.IntegerField(null=False)
    quantity = models.IntegerField(default=1)

    def __str__(self):
        return '%s' % self.id

    class Meta:
        db_table = 'order_product'
        ordering = ['-created_date', ]
