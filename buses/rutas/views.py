from django.shortcuts import render #, get_object_or_404
# FIXME from .models import Route, Trip, Stop, StopTime

def rutas(request):
    context = {
    }
    return render(request, 'rutas.html', context)
