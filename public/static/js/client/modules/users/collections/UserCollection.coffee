define [
    'backbone'
    'modules/users/models/UserModel'
], (Backbone, UserModel) ->

    class UserCollection extends Backbone.Collection
        model: UserModel
        url: "/api/v1/user/"

        parse: (response) ->
            return response.objects

    return UserCollection