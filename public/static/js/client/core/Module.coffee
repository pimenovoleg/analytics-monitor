define [
    'underscore'
    'cs!core/BusStation'
    'cs!core/AppRouter'
], (_, BusStation, AppRouter) ->

    class Module

        initialize: ->

        constructor: (options = {}) ->
            @_commands = []
            @_requests = []
            @_events = []

            @initialize options

        close: ->
            @resetCommands()
            @resetRequests()
            @resetEvents()
            @router?.stopListening()

        setRoutes: (routes) ->
            @router = new AppRouter routes: routes

        setCommands: (commands) ->
            if commands and _.isObject commands
                _.each commands, (val, key) =>
                        BusStation.commands.setHandler key, val
                        @_commands.push key

        setRequests: (requests) ->
            if requests and _.isObject requests
                    _.each requests, (val, key) =>
                            BusStation.reqres.setHandler key, val
                            @_requests.push key

        setEvents: (events) ->
            if events and _.isObject events
                    _.each events, (val, key) =>
                            BusStation.vent.on key, val
                            @_events.push key

        resetCommands: ->
            _.each @_commands, (val) =>
                    BusStation.commands.removeHandler val

            @_commands = []

        resetRequests: ->
            _.each @_requests, (val) =>
                    BusStation.reqres.removeHandler val

            @_requests = []

        resetEvents: ->
            _.each @_events, (val) =>
                    BusStation.vent.off val

            @_events = []

    return Module
