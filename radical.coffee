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

    table = document.createElement "table"
    days = [0 ... @currentDate.daysInMonth()]

    for week in [0 ... @currentDate.daysInMonth()/7]
      row = document.createElement "tr"

      for day in [0 ... 7]
        cell = document.createElement "td"
        cell.innerHTML = days.pop()
        row.appendChild(cell)

      table.appendChild(row)

    @node.innerHTML = ""
    @node.appendChild(table)
    return this

if typeof module != "undefined"
  module.exports = Radical
else
  @Radical = Radical
