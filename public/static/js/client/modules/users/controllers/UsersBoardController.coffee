define [
    'core-app'
    'modules/users/views/UsersBoardView'
    'modules/users/collections/UserCollection'
], (Core, UsersBoardView, UserCollection) ->

    class DashBoardController extends Core.Controller

        initialize: ->
            @userCollection = new UserCollection()
            @view = new UsersBoardView()

            @show @view
            @fillUserList()

        fillUserList: ->
            @view.createBackGrid(@userCollection)
            @userCollection.fetch {reset: true}


    return DashBoardController