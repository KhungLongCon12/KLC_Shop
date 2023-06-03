from django.shortcuts import render
from django.http import HttpResponse
from rest_framework import viewsets, permissions, generics, status
from rest_framework.parsers import MultiPartParser
from rest_framework.decorators import action
from rest_framework.response import Response
from rest_framework.views import APIView
from django.contrib.auth import authenticate, login
from .serializers import CategorySerializers, ProductSerializers, UserSerializers, \
    OrderSerializer, OrderProductSerializer, LoginSerializer, OrderSerializer1, OrderDetailSerializer
from .models import Category, Product, User, Order, OrderProduct
# Them moi
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import authentication_classes, permission_classes
from rest_framework_simplejwt.tokens import RefreshToken


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
                  generics.CreateAPIView,
                  generics.UpdateAPIView,
                  generics.RetrieveAPIView):
    queryset = User.objects.filter(is_active=True)
    serializer_class = UserSerializers
    parser_classes = [MultiPartParser, ]

    # def get_permissions(self):
    #     if self.action == 'retrieve':
    #         return [permissions.IsAuthenticated()]
    #
    #     return [permissions.AllowAny()]


# Them moi
class LoginView(APIView):
    serializer_class = LoginSerializer

    @authentication_classes([])
    @permission_classes([])
    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data, context={'request': request})
        serializer.is_valid(raise_exception=True)
        validated_data = serializer.validated_data

        # Lấy thông tin đăng nhập từ validated_data
        username = validated_data.get('username')
        password = validated_data.get('password')

        try:
            # Tìm người dùng theo username
            user = User.objects.get(username=username)

            # Kiểm tra mật khẩu
            if user.check_password(password):
                # Tạo JWT token
                refresh = RefreshToken.for_user(user)

                # Trả về token trong phản hồi
                return Response({
                    'access_token': str(refresh.access_token),
                    'refresh_token': str(refresh),
                })
            else:
                return Response({'detail': 'Invalid username or password'}, status=status.HTTP_400_BAD_REQUEST)
        except User.DoesNotExist:
            return Response({'detail': 'Invalid username or password'}, status=status.HTTP_400_BAD_REQUEST)


class OrderCreateView(APIView):
    def post(self, request):
        serializer = OrderSerializer1(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=201)
        return Response(serializer.errors, status=400)


class OrderDetailCreateView(APIView):
    def post(self, request):
        serializer = OrderDetailSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class PurchaseHistoryView(APIView):
    permission_classes = [IsAuthenticated]

    def get(self, request):
        user = request.user
        orders = Order.objects.filter(account=user)
        serializer = OrderSerializer1(orders, many=True)
        return Response(serializer.data)
