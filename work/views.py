from django.shortcuts import render

# Create your views here.
def work(request):
    return render(request, 'work.html', {'hide_bg_image': True})

def phonemarketplace(request):
    return render(request, 'marketplace.html', {'hide_bg_image': True})