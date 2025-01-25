from django.shortcuts import render
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, redirect
# Create your views here.

def home(request):
    return render(request, 'index.html')



 
