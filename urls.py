from django.conf.urls.defaults import patterns, include, url
from django.contrib import admin
admin.autodiscover()

from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = patterns('',
    url(r'^guide/', include('guide_app.urls')),

    url(r'^admin/', include(admin.site.urls))
)

urlpatterns += staticfiles_urlpatterns()