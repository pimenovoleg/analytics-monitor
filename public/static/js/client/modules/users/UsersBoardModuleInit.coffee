define [
    'core-app'
    'cs!core/BusStation'
    'cs!modules/users/controllers/UsersBoardController'
], (Core, BusStation, UsersBoardController) ->

    class DashBoardModuleInit extends Core.Module

        initialize: ->
            @setCommands
                "module:users:show:start": -> new UsersBoardController()

            @setRoutes
                "users": => @startController "show"


        startController: (controller) ->
            BusStation.commands.execute "module:users:#{controller}:start"
            BusStation.vent.trigger "module:users:selected"

    return DashBoardModuleInit