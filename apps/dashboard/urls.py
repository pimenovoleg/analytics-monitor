from django.conf.urls import patterns, include

from tastypie.api import Api

from .api.resource import DashBoardResource

v1_api = Api(api_name='v1')
v1_api.register(DashBoardResource())

urlpatterns = patterns(
    '',
    (r'^api/', include(v1_api.urls)),
)
