from django.contrib import admin
from .models import User


class UserAdmin(admin.ModelAdmin):
    list_display = ('pk', 'email', 'first_name', 'last_name', 'date_joined')
    search_fields = ('pk', 'email', 'first_name', 'last_name')
    list_per_page = 25


admin.site.register(User, UserAdmin)
