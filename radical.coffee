class Radical
  constructor: (node) ->
    if typeof node == "undefined"
      throw "you must pass a dom node"

    @node        = node
    @currentDate = (new Date)

    @render()

  getDay: () ->
    # not sure how you want to handle this @jeff

  renderedMonth: () ->
    month: @currentDate.getMonth()
    year: @currentDate.getFullYear()

  nextMonth: () ->
    # add a month to currentDate
    # call @render

  prevMonth: () ->
    # remove a month to currentDate
    # call @render

  render: (date) ->
    # if (date)
      # do something
    # render into @node

if typeof module != "undefined"
  module.exports = Radical;
