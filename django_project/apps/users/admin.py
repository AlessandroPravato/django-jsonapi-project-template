from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as DjangoUserAdmin

from .models import User


@admin.register(User)
class UserAdmin(DjangoUserAdmin):

  fieldsets = [
    (None, {'fields': ('email', 'password')}),
    (('Personal info'), {'fields': ('first_name', 'last_name')}),
    (('Permissions'), {'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')}),
  ]
  add_fieldsets = [
    (None, {
      'classes': ('wide',),
      'fields': ('email', 'password1', 'password2'),
    }),
  ]
  list_display = ['email', 'first_name', 'last_name', 'is_staff', 'is_superuser', 'is_active', 'last_login']
  search_fields = ['email', 'first_name', 'last_name', 'company',]
  ordering = ['email']
