from rest_framework import serializers
from .models import Task, UserTask, Announcement


class TaskSerializer(serializers.ModelSerializer):
    class Meta:
        model = Task
        fields = ('pk', 'assigned_by', 'title', 'description', 'due_date')


class UserTaskSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserTask
        fields = ('pk', 'task', 'assigned_to', 'status')


class AnnouncementSerializer(serializers.ModelSerializer):
    class Meta:
        model = Announcement
        fields = ('pk', 'sent_by', 'sent_to', 'title',
                  'description', 'sent_date')
