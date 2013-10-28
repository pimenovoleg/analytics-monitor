define [
  'jquery',
  'backbone',
  'underscore'
], ($, Backbone, _) ->

    class BaseModel extends Backbone.Model
        constructor: ->
            Backbone.Model::constructor.apply(this, _.toArray(arguments))

            @listenTo(this, 'error', @serverErrors)

        serverErrors: (model, response, options = {}) ->
            if response.status == 404
                errors = JSON.parse(response.responseText).errors
                model.validationError = errors
                model.trigger "invalid", model, errors, _.extend(options,
                  validationError: errors
                )
