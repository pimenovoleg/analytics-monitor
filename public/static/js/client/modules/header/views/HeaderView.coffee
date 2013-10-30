define [
    'core-app'
    'tpl!modules/header/templates/header.tpl'
], (Core, HeaderTemplate) ->

    class HeaderView extends Marionette.ItemView

        template: HeaderTemplate
        ui:
            usersModuleLink : '#users-module-link'
            dashboardModuleLink : '#users-module-link'

    return HeaderView