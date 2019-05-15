from django.urls import path, include
from . import views

app_name = 'libro'

urlpatterns = [
    path('home/', views.genero, name="genero"),
]