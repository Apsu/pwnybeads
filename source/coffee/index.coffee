"use strict"

pwnybeads = exports?.pwnybeads ? @pwnybeads = {}

# Selector computed observable
pwnybeads.selector = (cb, def) ->
  @selected = ko.observable def ? {} unless @selected?
  ko.computed
    read: =>
      @selected()
    write: (data) =>
      @selected data
      cb data if cb?

$ ->
  ViewModel = ->
    @faqNav = ko.observableArray()
    @galleryNav = ko.observableArray()
    @galleryImages = ko.observableArray()
    @siteNav = ko.observableArray()
    @siteActive = pwnybeads.selector (data) =>
      # Reload mapped data on template load
      switch data.name 
        when "Gallery" 
          @getMappedData "/api/gallery/nav", @galleryNav
          @getMappedData "/api/gallery/images", @galleryImages
        when "FAQ"
          @getMappedData "/api/faq/nav", @faqNav

    # Get JSON data from url, map to pin, call cb
    @getMappedData = (url, pin, cb) ->
      $.getJSON url, (data) ->
        ko.mapping.fromJS data.items, {}, pin
        cb() if cb?

    # Template accessor that avoids data-loading race
    @getTemplate = ko.computed =>
      @siteActive()?.template?() ? {}

    # Preload data
    @getMappedData "/api/site/nav", @siteNav, =>
      @siteActive @siteNav()[0]
    @getMappedData "/api/gallery/nav", @galleryNav
    @getMappedData "/api/gallery/images", @galleryImages
    @getMappedData "/api/faq/nav", @faqNav

    @ # Return ourself

  ko.applyBindings new ViewModel()
