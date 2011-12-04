from django.conf.urls.defaults import patterns, url
import guide_app.views as views

urlpatterns = patterns('',
    url(r'^$', views.HomeView.as_view())
)