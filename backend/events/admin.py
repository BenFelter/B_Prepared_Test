from django.contrib import admin
from .models import Task, UserTask, Announcement


class TaskAdmin(admin.ModelAdmin):
    list_display = ('pk', 'title', 'description',
                    'assigned_by', 'due_date')
    list_per_page = 25


class UserTaskAdmin(admin.ModelAdmin):
    list_display = ('pk', 'task', 'assigned_to', 'status')
    list_per_page = 25


class AnnouncementAdmin(admin.ModelAdmin):
    list_display = ('pk', 'title', 'description',
                    'sent_by', 'sent_date')
    list_per_page = 25


admin.site.register(Task, TaskAdmin)
admin.site.register(UserTask, UserTaskAdmin)
admin.site.register(Announcement, AnnouncementAdmin)
