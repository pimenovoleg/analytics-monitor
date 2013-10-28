define [
    'core-app'
    'cs!modules/header/HeaderModuleInit'
    'cs!modules/dashboard/DashBoardModuleInit'
], (Core, HeaderModuleInit, DashBoardModuleInit) ->

    App = new Core.Application()

    App.addRegions
        headerRegion: "#header-region"
        contentRegion: "#content-region"

    App.setDefaultRegion App.contentRegion

    App.addInitializer ->
        new HeaderModuleInit App.headerRegion
        new DashBoardModuleInit

    return App