define [
    'underscore'
    'cs!core/Application'
    'cs!core/BusStation'
    'cs!core/AppRouter'
    'cs!core/BaseModel'
    'cs!core/Controller'
    'cs!core/Module'
], (_, Application, BusStation, AppRouter, BaseModel, Controller, Module) ->

    return {
        "Application": Application
        "AppRouter": AppRouter
        "Model": BaseModel
        "Controller": Controller
        "Module": Module
    }