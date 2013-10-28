define [
    'core-app'
    'cs!core/BusStation'
    'cs!modules/dashboard/controllers/DashBoardController'
], (Core, BusStation, DashBoardController) ->

    class DashBoardModuleInit extends Core.Module

        initialize: ->
            @setCommands
                "module:dashboard:show:start": -> new DashBoardController()

            @setRoutes
                "dashboard": => @startController "show"


        startController: (controller) ->
            BusStation.commands.execute "module:dashboard:#{controller}:start"
            BusStation.vent.trigger "module:dashboard:selected"

    return DashBoardModuleInit