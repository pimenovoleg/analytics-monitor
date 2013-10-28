define [
    'core-app'
    'cs!modules/dashboard/views/DashBoardView'
], (Core, DashBoardView) ->

    class DashBoardController extends Core.Controller

        initialize: ->
            @show new DashBoardView()

    return DashBoardController