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

    monthHeader = document.createElement('th')
    monthHeader.setAttribute 'colspan', "7"
    monthHeader.innerHTML = @currentDate.format("MMMM")
    row1 = document.createElement('tr')
    row1.appendChild(monthHeader)
    table.appendChild(row1)

    #
    # day of the week header
    #

    row2 = document.createElement('tr')

    for dow in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      dowHeader = document.createElement('th')
      dowHeader.innerHTML = dow
      row2.appendChild(dowHeader)

    table.appendChild(row2)

    #
    # days in the month
    #

    days = [1 ... @currentDate.daysInMonth() + 1]

    # The current issue is here - it doesn't render enough table
    # rows if the start day offset pushes it into one more row than the
    # number straight up divided by 7 requires.

    # By adding 6 here i guarantee that it's never wrong, but also
    # add an extra <tr> sometimes, which we can't have. Either way, this
    # is where the problem is, we'll figure it out tomorrow!
    for week in [1 ... @currentDate.daysInMonth() + 6] by 7
      row = document.createElement "tr"

      for day in [0 ... 7]
        cell = document.createElement "td"
        dayOfWeek = moment("#{@currentDate.year()}-#{@currentDate.month()+1}-#{days[0]}").day()
        cell.innerHTML = days.shift() if dayOfWeek == day
        row.appendChild(cell)

      table.appendChild(row)

    #
    # build
    #

    @node.innerHTML = ""
    @node.appendChild(table)
    @

if typeof module != "undefined"
  module.exports = Radical
else
  @Radical = Radical
