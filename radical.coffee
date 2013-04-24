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
    table.setAttribute("border", "1px")

    for i in [0 ... 10]
      workingRow = document.createElement "tr"
      for j in [0 ... 5]
        workingDay = document.createElement "td"
        workingDay.innerHTML = j
        workingRow.appendChild workingDay
      table.appendChild workingRow

    @node.innerHTML = ""
    @node.appendChild table
    @

if typeof module != "undefined"
  module.exports = Radical
else
  @Radical = Radical
