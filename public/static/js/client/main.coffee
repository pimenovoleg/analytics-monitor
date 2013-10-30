require.config
        paths:
            'cs': '../vendors/coffee-script/cs'
            'coffee-script': '../vendors/coffee-script/coffee-script'

            'bootstrap': '../vendors/bootstrap'

            'backbone': '../vendors/backbone/backbone'
            'backbone-marionette': '../vendors/backbone/backbone.marionette'
            'backbone-babysitter': '../vendors/backbone/backbone.babysitter'
            'backbone-wreqr': '../vendors/backbone/backbone.wreqr'

            'backbone-backgrid': '../vendors/backbone/backgrid'
            'backbone-backgrid-paginator': '../vendors/backbone/backgrid-paginator'

            'underscore': '../vendors/underscore/underscore'
            'tpl': '../vendors/underscore/tpl'

            'domReady': '../vendors/require/domReady'

            'jquery': '../vendors/jquery/jquery-2.0.2'

            'core-app': 'core/Core'

        shim: {
            'backbone-backgrid': {
                deps: ['jquery', 'underscore', 'backbone']
                exports: 'Backgrid'
            }
            'jquery': {
                exports: '$'
            }
            'underscore': {
                exports: '_'
            }
            'backbone': {
                deps: ['jquery', 'underscore']
                exports: 'Backbone'
            }
            'backbone-marionette': {
                deps: ['backbone']
                exports: "Marionette"
            }
            'backbone-babysitter': {
                deps: ['backbone']
            }
        }
        waitSeconds: 20

require ['domReady', 'cs!app'], (domReady, App) ->
    domReady ->
        App.start()