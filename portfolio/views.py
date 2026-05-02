from django.http import HttpResponse


def health_check(request):
    """Lightweight health check endpoint used by Render.com to verify the app is running."""
    return HttpResponse("OK", content_type="text/plain", status=200)
