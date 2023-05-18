from rest_framework.serializers import ModelSerializer
from .models import Category, Product, User


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
