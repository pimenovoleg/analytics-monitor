define [
    'jquery'
    'backbone-marionette'
    'core-app'
    'backbone-backgrid'
    'tpl!modules/users/templates/users.tpl'
], ($, Marionette, Core, Backgrid, DashBoardTemplate) ->

    class DashBoardView extends Marionette.ItemView
        template: DashBoardTemplate

        onRender: ->


        createBackGrid: (userCollection)->

            columns = [{
              name: "id",
              label: "ID",
              editable: false,
              cell: Backgrid.IntegerCell.extend({
                orderSeparator: ''
              })
            }, {
              name: "username"
              label: "UserName"
              cell: "string"
            }, {
              name: "is_active"
              label: "is_active"
              cell: "boolean"
            }, {
              name: "date_joined"
              label: "Date Joined"
              cell: "string"
            }];

            grid = new Backgrid.Grid {
                columns: columns
                collection: userCollection
            }

            @$el.append(grid.render().$el);

    return DashBoardView
