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

    #
    # month header
    #

    month_header = document.createElement('th')
    month_header.setAttribute 'colspan', "7"
    month_header.innerHTML = @currentDate.format("MMMM")
    row1 = document.createElement('tr')
    row1.appendChild(month_header)
    table.appendChild(row1)

    #
    # day of the week header
    #

    row2 = document.createElement('tr')

    for dow in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      dow_header = document.createElement('th')
      dow_header.innerHTML = dow
      row2.appendChild(dow_header)

    table.appendChild(row2)

    #
    # days in the month
    #

    days = [1 ... @currentDate.daysInMonth() + 1]

    for week in [0 ... @currentDate.daysInMonth() + 1] by 7
      row = document.createElement "tr"

      for day in [0 ... 7]
        cell = document.createElement "td"
        day_of_week = moment("#{@currentDate.year()}-#{@currentDate.month()+1}-#{days[0]}").day()
        cell.innerHTML = days.shift() if day_of_week == day
        row.appendChild(cell)

      table.appendChild(row)

    #
    # build
    #

    @node.innerHTML = ""
    @node.appendChild(table)
    return this

if typeof module != "undefined"
  module.exports = Radical
else
  @Radical = Radical
