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
    @currentDate = @currentDate.add('months', 1)
    @render()

  prevMonth: () ->
    @currentDate = @currentDate.subtract('months', 1)
    @render()

  render: ->
    table = document.createElement "table"
    days = [1 ... @currentDate.daysInMonth() + 1]

    for week in [0 ... @currentDate.daysInMonth()] by 7
      row = document.createElement "tr"

      for day in [0 ... 7]
        cell = document.createElement "td"
        day_of_week = moment("#{@currentDate.year()}-#{@currentDate.month()+1}-#{days[0]}").day()
        cell.innerHTML = days.shift() if day_of_week == day
        row.appendChild(cell)

      table.appendChild(row)

    @node.innerHTML = ""
    @node.appendChild(table)
    return this

if typeof module != "undefined"
  module.exports = Radical
else
  @Radical = Radical
