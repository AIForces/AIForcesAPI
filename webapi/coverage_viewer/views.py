from django.http.response import HttpResponse, HttpResponseNotFound
from django.core.files.storage import FileSystemStorage
from django.conf import settings
from django.shortcuts import redirect
from django.urls import reverse_lazy
import mimetypes

def coverage(request, file):
    filepath = settings.PROJECT_PATH + "/htmlcov/"
    files = FileSystemStorage(filepath)

    if files.exists(file):
        response = HttpResponse(files.open(file))
        response['Content-Type'] = mimetypes.guess_type(file)[0]
        return response
    else:
        return HttpResponseNotFound()

def cov_redirect(request):
    return redirect(reverse_lazy("coverage:file-viewer", args=["index.html"]), permanent=True)
