from django.http import HttpResponse
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils import simplejson
from django.views.generic import View

class HomeView(View):
    
    def get(self, request):
        context = RequestContext(request)

        return render_to_response('home.html', context)