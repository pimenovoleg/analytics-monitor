define [
    'jquery'
    'backbone'
], ($, Backbone) ->

    Backbone.Tastypie =
        doGetOnEmptyPostResponse: true
        doGetOnEmptyPutResponse: false
        apiKey: {
            username: ''
            key: ''
        }

    Backbone.oldSync = Backbone.sync;

    Backbone.sync = (method, model, options) ->
        headers = ''

        if (Backbone.Tastypie.apiKey && Backbone.Tastypie.apiKey.username.length)
            headers  = _.extend({
                'Authorization': 'ApiKey ' + Backbone.Tastypie.apiKey.username + ':' + Backbone.Tastypie.apiKey.key
            }, options.headers )
            options.headers = headers

        if ((method is 'create' && Backbone.Tastypie.doGetOnEmptyPostResponse) or
                (method is 'update' && Backbone.Tastypie.doGetOnEmptyPutResponse ))
            dfd = new $.Deferred();

            dfd.done(options.success);

            options.success = (resp, status, xhr) ->
                if (!resp && ( xhr.status is 201 || xhr.status is 202 || xhr.status is 204))
                    location = xhr.getResponseHeader( 'Location' ) || model.id
                    return $.ajax({
                       url: location
                       headers: headers
                       success: dfd.resolve
                       error: dfd.reject
                    });
                else
                    return dfd.resolveWith(options.context || options, [resp, status, xhr])

            dfd.fail(options.error)

            options.error = (xhr, status, resp) ->
                dfd.rejectWith(options.context || options, [xhr, status, resp]);

            dfd.request = Backbone.oldSync( method, model, options )

            return dfd;

        return Backbone.oldSync(method, model, options)

    Backbone.Model.prototype.idAttribute = 'resource_uri'

    Backbone.Model.prototype.url = () ->
        url = @id

        if (!url)
            url = @urlRoot;
            url = url or this.collection and  if @collection.url?() then @collection.url() else @collection.url

            if (url and this.has('id'))
                url = addSlash(url) + this.get('id')

        url = url and addSlash(url)

        return url or null

    Backbone.Model.prototype.parse = (data) ->
        return data and data.objects and (if _.isArray( data.objects) then data.objects[ 0 ] else data.objects) or data

    Backbone.Collection.prototype.parse = (response) ->
        if response and response.meta
            @meta = response.meta;

        return response and response.objects

    Backbone.Collection.prototype.url = (models) ->
        url = @urlRoot or (models and models.length and models[0].urlRoot)
        url = url && addSlash(url)

        if models && models.length
           ids = _.map models, (model) ->
                    parts = _.compact(model.id.split('/'))
                    itter = parts.length - 1
                    return parts[itter]

            url += 'set/' + ids.join( ';' ) + '/';

        return url || null

    addSlash = (str) ->
        return str + (str.length > 0 and if (str.charAt( str.length - 1 ) is '/' ) then '' else '/')



