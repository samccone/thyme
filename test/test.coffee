g          = global
g.Radical  = require("../radical")
g.assert   = require("assert")
g.fs       = require("fs")
g.path     = require("path")
g.moment   = require("moment")
g.jsdom    = require("jsdom").jsdom
g.document = jsdom(fs.readFileSync(path.join(__dirname, 'test.html')))

beforeEach ->
  g.myCal = new Radical document.getElementById("hold")

describe "creation", ->

  it "should not bomb if container is passed", ->
    new Radical document.getElementById("hold")

  it "should bomb if container not is passed", (done) ->
    try
      new Radical
    catch e
      done()

describe "rendered month", ->
  it "should return current match current month/year", ->
    renderedMonth = myCal.renderedMonth()

    assert.deepEqual renderedMonth,
      month: (new Date).getMonth(),
      year: (new Date).getFullYear()

 # months are 0 indexed
describe 'month traversal', ->

  it 'should return correct next month', ->
    assert.equal(myCal.currentDate.month() + 1, myCal.nextMonth().currentDate.month())

  it 'should return correct previous month', ->
    assert.equal(myCal.currentDate.month() - 1, myCal.prevMonth().currentDate.month())

  it 'should render any month passed', ->
    assert.equal(myCal.render('2013-7-9').currentDate.month(), 6)
