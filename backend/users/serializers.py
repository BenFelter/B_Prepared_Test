from rest_framework import serializers
from .models import User


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('pk', 'email', 'first_name',
                  'last_name', 'date_joined', 'last_login', 'is_active', 'is_staff', 'is_superuser', 'password')
        read_only_fields = ('pk', 'date_joined', 'last_login',
                            'is_active', 'is_staff', 'is_superuser')
        extra_kwargs = {
            'password': {'write_only': True}
        }

    def create(self, validated_data):  # ensure password is hashed
        password = validated_data.get('password', '')
        user = super().create(validated_data)
        user.set_password(password)
        user.save()
        return user
