Radical       = require("../radical"),
assert        = require("assert"),
fs            = require("fs"),
path          = require("path"),
moment        = require("moment"),
jsdom         = require("jsdom").jsdom,
document      = jsdom(fs.readFileSync(path.join(__dirname, 'test.html')));

beforeEach(function() {
  myCal = new Radical(document.getElementById("hold"));
});

describe("creation", function() {
  it("should not bomb if container is passed", function() {
    new Radical(document.getElementById("hold"));
  });

  it("should bomb if container not is passed", function(done) {
    try {
      new Radical
    } catch(e) {
      done()
    }
  });
});

describe("rendered month", function() {
  it("should return current match current month/year", function() {
    var renderedMonth = myCal.renderedMonth();

    assert.deepEqual(renderedMonth, {
      month: (new Date).getMonth(),
      year: (new Date).getFullYear()
    });
  });
});

// months are 0 indexed
describe('month traversal', function(){
  it('should return correct next month', function(){
    assert.equal(myCal.currentDate.month() + 1, myCal.nextMonth().currentDate.month())
  });

  it('should return correct previous month', function(){
    assert.equal(myCal.currentDate.month() - 1, myCal.prevMonth().currentDate.month())
  });

  it('should render any month passed', function(){
    assert.equal(myCal.render('2013-7-9').currentDate.month(), 6)
  });
});
