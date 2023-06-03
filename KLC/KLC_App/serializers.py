from rest_framework.serializers import ModelSerializer
from .models import Category, Product, User, Order, OrderProduct
from rest_framework import serializers


class CategorySerializers(ModelSerializer):
    class Meta:
        model = Category
        fields = ["id", "name"]


class ProductSerializers(ModelSerializer):
    # category = CategorySerializers()

    class Meta:
        model = Product
        fields = ["id", "name", "description", "price", "image", "category"]


class UserSerializers(ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'first_name', 'last_name', 'email', 'username', 'password', 'avatar']
        extra_kwargs = {
            'password': {'write_only': 'true'}
        }

    def create(self, validated_data):
        user = User(**validated_data)
        user.set_password(validated_data['password'])
        user.save()

        return user


class OrderProductSerializer(ModelSerializer):
    class Meta:
        model = OrderProduct
        fields = ('id', 'order', 'product', 'quantity')


class OrderSerializer(ModelSerializer):
    product = OrderProductSerializer(many=True)

    class Meta:
        model = Order
        fields = ('id', 'account', 'name', 'address', 'phone', 'paid_amount')

    def create(self, validated_data):
        item_datas = validated_data.pop('items')
        order = Order.objects.create(**validated_data)
        for item_data in item_datas:
            OrderProduct.objects.create(order=order, **item_data)
        return order


class OrderItemSerializer(ModelSerializer):
    class Meta:
        model = OrderProduct
        fields = ['product', 'quantity', 'price']


class MyOrderItemSerializer(ModelSerializer):
    product = ProductSerializers()

    class Meta:
        model = OrderProduct
        fields = ['product', 'quantity', 'price']


class MyOrderSerializer(ModelSerializer):
    items = MyOrderItemSerializer(many=True)

    class Meta:
        model = Order
        fields = ('id', 'account', 'name', 'address', 'phone', 'paid_amount')


# Them moi
class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()


class OrderSerializer1(serializers.ModelSerializer):
    class Meta:
        model = Order
        fields = ['id', 'account', 'name', 'address', 'phone', 'paid_amount']


class OrderDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrderProduct
        fields = ['id', 'order', 'quantity', 'price', 'product']
