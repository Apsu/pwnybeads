"use strict"

# Grab namespace
pwnybeads = exports?.pwnybeads ? @pwnybeads

$ ->
  IndexModel = ->
    @sections = ko.observableArray [
      name: "Home"
      template: "homeTemplate"
    ,
      name: "About"
      template: "aboutTemplate"
    ,
      name: "Gallery"
      template: "galleryTemplate"
    ,
      name: "Store"
      template: "storeTemplate"
    ,
      name: "Sizing"
      template: "sizingTemplate"
    ,
      name: "Blog"
      template: "blogTemplate"
    ,
      name: "FAQ"
      template: "faqTemplate"
    ,
      name: "Contact"
      template: "contactTemplate"
    ]

    @section = pwnybeads.selector @sections(), (data) ->
      switch data.name
        when "Gallery"
          # load data
          console.log "Load gallery data"
    , @sections()[0] # Set default

    @galleryThumbs = ko.mapping.fromJS [
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ,
      title: "Test"
      thumbURL: "http://placehold.it/128x128"
      fullURL: "http://placehold.it/128x128"
    ]

    @galleryNav = ko.mapping.fromJS [
      type: "nav-header"
      name: "Section A"
    ,
      type: ""
      name: "Item 1"
    ,
      type: ""
      name: "Item 2"
    ,
      type: "divider"
    ,
      type: ""
      name: "Item 3"
    ]

    @ # Return ourself

  popoverOptions =
    delay: 0
    trigger: "hover"
    animation: true
    placement: pwnybeads.get_popover_placement

  ko.bindingHandlers.popper =
    init: (element, valueAccessor) ->
      $(element).popover popoverOptions

  ko.applyBindings new IndexModel()
