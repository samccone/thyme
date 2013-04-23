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
    month: @currentDate.month()
    year: @currentDate.year()

  nextMonth: () -> 
    @render(@currentDate.add('months', 1))

  prevMonth: () ->
    @render(@currentDate.subtract('months', 1))

  render: (date) ->
    if date
      @currentDate = if typeof date == 'string' then moment(date) else date
    @currentDate
    # render into @node

if typeof module != "undefined"
  module.exports = Radical;
