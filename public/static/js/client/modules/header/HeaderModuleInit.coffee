define [
    'core-app'
    'cs!modules/header/controllers/HeaderController'
], (Core, HeaderController) ->

    class HeaderModuleInit extends Core.Module

        initialize: (region) ->
            new HeaderController(region: region)

    return HeaderModuleInit