define [
    'backbone-wreqr'
], (Wreqr) ->

    BusStation =
        commands: new Wreqr.Commands()
        reqres: new Wreqr.RequestResponse()
        vent: new Wreqr.EventAggregator()

    return BusStation