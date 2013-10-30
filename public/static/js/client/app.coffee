define [
    'core-app'
    'cs!modules/header/HeaderModuleInit'
    'cs!modules/users/UsersBoardModuleInit'
], (Core, HeaderModuleInit, UsersBoardModuleInit) ->

    App = new Core.Application()

    App.addRegions
        headerRegion: "#header-region"
        contentRegion: "#content-region"

    App.setDefaultRegion App.contentRegion

    App.addInitializer ->
        new HeaderModuleInit App.headerRegion
        new UsersBoardModuleInit

    return App