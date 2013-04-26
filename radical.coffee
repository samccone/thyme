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

  initalMonthShift: ->
    moment("#{@currentDate.year()}-#{@currentDate.month()+1}-1").day()


  _buildMonthHeader: ->
    monthHeader = document.createElement('th')
    monthHeader.setAttribute 'colspan', "7"
    monthHeader.innerHTML = @currentDate.format("MMMM")
    row1 = document.createElement('tr')
    row1.appendChild(monthHeader)
    row1

  _buildDayOfWeekHeader: ->
    row2 = document.createElement('tr')

    for dow in ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
      dowHeader = document.createElement('th')
      dowHeader.innerHTML = dow
      row2.appendChild(dowHeader)
    row2

  render: ->
    table = document.createElement "table"
    table.appendChild @_buildMonthHeader()
    table.appendChild @_buildDayOfWeekHeader()

    days = [1 ... @currentDate.daysInMonth() + 1]

    for week in [1 ... @currentDate.daysInMonth() + @initalMonthShift()+1] by 7
      row = document.createElement "tr"
      for day in [0 ... 7]
        cell = document.createElement "td"
        dayOfWeek = moment("#{@currentDate.year()}-#{@currentDate.month()+1}-#{days[0]}").day()
        cell.innerHTML = days.shift() if dayOfWeek == day
        row.appendChild(cell)

      table.appendChild(row)


    @node.innerHTML = ""
    @node.appendChild(table)
    @

if typeof module != "undefined"
  module.exports = Radical
else
  @Radical = Radical
