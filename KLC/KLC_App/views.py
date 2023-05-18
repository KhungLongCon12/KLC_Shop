from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import viewsets, permissions, generics, status
from rest_framework.parsers import MultiPartParser
from rest_framework.decorators import action
from rest_framework.response import Response
# from rest_framework.views import APIView
# from django.contrib.auth import authenticate, login
from .serializers import CategorySerializers, ProductSerializers, UserSerializers
from .models import Category, Product, User


class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.filter(active=True)
    serializer_class = CategorySerializers

    # permission_classes = [permissions.IsAuthenticated]

    # def get_permissions(self):
    #     if self.action == 'list':
    #         return [permissions.AllowAny()]
    #
    #     return [permissions.IsAuthenticated]


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.filter(active=True)
    serializer_class = ProductSerializers

    # def get_permissions(self):
    #     if self.action == 'list':
    #         return [permissions.AllowAny()]
    #
    #     return [permissions.IsAuthenticated]

    @action(methods=['post'], detail=True, url_path="hide-product", url_name="hide-product")
    # /product/{pk}/hide-product
    def hide_product(self, request, pk):
        try:
            p = Product.objects.get(pk=pk)
            p.active = False
            p.save()
        except Product.DoesNotExits:
            return Response(status=status.HTTP_400_BAD_REQUEST)

        return Response(data=ProductSerializers(p, context={'request': request}).data, status=status.HTTP_200_OK)


class UserViewSet(viewsets.ViewSet,
                  generics.ListAPIView,
                  generics.CreateAPIView,
                  generics.RetrieveAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializers
    parser_classes = [MultiPartParser, ]

    # def get_permissions(self):
    #     if self.action == 'retrieve':
    #         return [permissions.IsAuthenticated()]
    #
    #     return [permissions.AllowAny()]


# class LoginView(APIView):
#     def post(self, request, format=None):
#         data = request.data
#         username = data.get('username', None)
#         password = data.get('password', None)
#         user = authenticate(username=username, password=password)
#         if user is not None:
#             if user.is_active:
#                 login(request, user)
#                 serializer = UserSerializers(user)
#                 return Response(serializer.data)
#             else:
#                 return Response({'error': 'This account has been disabled.'}, status=status.HTTP_400_BAD_REQUEST)
#         else:
#             return Response({'error': 'Invalid login credentials.'}, status=status.HTTP_400_BAD_REQUEST)
