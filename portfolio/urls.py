
from django.contrib import admin
from django.urls import path, include
from . import views

urlpatterns = [
    path('health/', views.health_check, name='health_check'),
    path('admin/', admin.site.urls),
    path('', include('home.urls')),
    path('about/', include('about.urls')),
    path('contact/', include('contact.urls')),
    path('work/', include('work.urls')),
]
