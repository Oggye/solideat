from django.urls import path
from .views import base, utilisateur, message, restaurant

urlpatterns = [
    path('', base, name="home"),
    path('utilisateur/', utilisateur, name="utilisateur"),
    path('message/', message, name="message"),
    path('restaurant/', restaurant, name="restaurant"),
]
