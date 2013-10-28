define [
    'backbone-marionette'
    'core-app'
    'tpl!modules/dashboard/templates/dashboard.tpl'
], (Marionette, Core, DashBoardTemplate) ->

    class DashBoardView extends Marionette.ItemView
        template: DashBoardTemplate

    return DashBoardView