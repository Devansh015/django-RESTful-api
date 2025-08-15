from django.contrib import admin
from django.urls import path

urlpatterns = [
    path('admin/', admin.site.urls),
]

from django.conf.urls import url, include
from django.contrib import admin
from api.resources import NoteResource
note_resource = NoteResource()
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^api/', include(note_resource.urls)),
]
