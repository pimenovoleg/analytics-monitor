from django.conf.urls import patterns, include, url

from django.contrib import admin
from tastypie.api import Api
from dashboard.api.resource import DashBoardResource, UserResource

from mainpage.views import MainPageView

admin.autodiscover()


urlpatterns = patterns(
    '',
    url(r'^$', MainPageView.as_view(), name='index'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^grappelli/', include('grappelli.urls')),
)

v1_api = Api(api_name='v1')
v1_api.register(DashBoardResource())
v1_api.register(UserResource())


urlpatterns += patterns(
    '',
    (r'^api/', include(v1_api.urls)),
)