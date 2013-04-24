Radical = require("../radical");
moment  = require("moment");
assert  = require("assert");

describe("creation", function() {
  it("should not bomb if container is passed", function() {
    new Radical("this is a dom node");
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
    var tmp = new Radical("this is a dom node");
    var renderedMonth = tmp.renderedMonth();

    assert.deepEqual(renderedMonth, {
      month: (new Date).getMonth(),
      year: (new Date).getFullYear()
    });
  });
});

// months are 0 indexed
describe('month traversal', function(){

  it('should return correct next month', function(){
    var tmp = new Radical("node");
    assert.equal(tmp.currentDate.month() + 1, tmp.nextMonth().month())
  });

  it('should return correct previous month', function(){
    var tmp = new Radical("node");
    assert.equal(tmp.currentDate.month() - 1, tmp.prevMonth().month())
  });

  it('should render any month passed', function(){
    var tmp = new Radical("node");
    assert.equal(tmp.render('2013-7-9').month(), 6)
  });

});
