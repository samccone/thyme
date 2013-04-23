class Radical
  constructor: (node) ->
    if typeof node == "undefined"
      throw "you must pass a dom node"

    @node        = node
    @currentDate = moment(new Date)

    @render()

  getDay: () ->
    # loop through current month's days
    # until we get a text match...?

  renderedMonth: () ->
    month: @currentDate.getMonth()
    year: @currentDate.getFullYear()

  nextMonth: () ->
    @currentDate = @currentDate.add 'months', 1
    # call @render

  prevMonth: () ->
    @currentDate = @currentDate.subtract 'months', 1
    # call @render

  render: (date) ->
    # if (date)
      # do something
    # render into @node

if typeof module != "undefined"
  module.exports = Radical;
