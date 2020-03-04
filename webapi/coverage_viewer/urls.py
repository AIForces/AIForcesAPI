from django.urls import re_path

from . import views

urlpatterns = [
    re_path('^(?P<file>[\w.\-_]+)$', views.coverage, name="coverage_file_viewer")
]
