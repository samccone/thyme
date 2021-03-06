should   = require("should")
fs       = require("fs")
path     = require("path")
jsdom    = require("jsdom").jsdom
Thyme  = require("../thyme")
global.document = document = jsdom(fs.readFileSync(path.join(__dirname, 'test.html')))
global.moment   = moment = require("moment")

beforeEach ->
  global.myCal = new Thyme document.getElementById("hold")

describe "creation", ->

  it "should not bomb if container is passed", ->
    new Thyme document.getElementById("hold")

  it "should bomb if container not is passed", (done) ->
    try
      new Thyme
    catch e
      done()

describe "rendered month", ->
  it "should return current match current month/year", ->
    renderedMonth = myCal.renderedMonth()

    renderedMonth.should.eql { month: (new Date).getMonth(), year: (new Date).getFullYear() }

 # months are 0 indexed
describe 'month traversal', ->

  it 'should return correct next month', ->
    current_month = myCal.currentDate.month()
    next_month = myCal.nextMonth().currentDate.month()
    next_month.should.equal current_month + 1

  it 'should return correct previous month', ->
    current_month = myCal.currentDate.month()
    previous_month = myCal.prevMonth().currentDate.month()
    previous_month.should.equal current_month - 1

  it 'should render any month passed', ->
    myCal.currentDate = moment('2013-7-9')
    myCal.render().currentDate.month().should.equal 6

describe 'getting days', ->
  it 'should get the first element', ->
    myCal.getDay(1).innerHTML.should.equal '1'

  it 'should get the last element', ->
    myCal.getDay(myCal.currentDate.daysInMonth()).innerHTML.should.equal '30'
