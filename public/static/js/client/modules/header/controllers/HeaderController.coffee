define [
    'core-app'
    'cs!core/BusStation'
    'cs!modules/header/views/HeaderView'
], (Core, BusStation, HeaderView) ->

    class HeaderController extends Core.Controller

        initialize: ->
            headerView = new HeaderView()
            @show headerView

            BusStation.vent.on "module:users:selected", =>
                @activateNavLink headerView.ui.usersModuleLink

            BusStation.vent.on "module:users:selected", =>
                @activateNavLink headerView.ui.dashboardModuleLink

        activateNavLink: ($link) ->
            $parent = $link.parent()
            activeClass = 'active'
            $parent.siblings().removeClass activeClass
            $parent.addClass activeClass

    return HeaderController