from django.urls import path
from . import views

app_name = 'work'

urlpatterns = [
    path('', views.work, name='work'),
    path('phonemarketplace/',views.phonemarketplace, name='phonemarketplace')
]
