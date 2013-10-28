from django.contrib.auth.models import User

from tastypie.resources import ModelResource
from tastypie.paginator import Paginator
from dashboard.model import DashBoardModel


class DashBoardResource(ModelResource):
    class Meta:
        queryset = DashBoardModel.objects.all()
        resource_name = 'dashboard'

        list_allowed_methods = ['get', 'post', 'put', 'delete']
        detail_allowed_methods = ['get', 'post', 'put', 'delete']
        allowed_methods = ['get', 'post', 'delete', 'put']

        always_return_data = True
        paginator_class = Paginator

    def determine_format(self, request):
        return "application/json"


class UserResource(ModelResource):
    class Meta:
        queryset = User.objects.all()
        resource_name = 'user'

        fields = ('username', 'id', 'date_joined', 'is_active')

        allowed_methods = ['get']

    def determine_format(self, request):
        return "application/json"
