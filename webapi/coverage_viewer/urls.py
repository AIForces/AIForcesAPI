from django.urls import re_path, path

from . import views

app_name = "coverage"
urlpatterns = [
    path('<str:file>', views.coverage, name="file-viewer"),
    path('', views.cov_redirect, name="redirect")
]
