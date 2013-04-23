radical = require("../radical");
moment  = require("moment");
assert  = require("assert");

describe("creation", function() {
  it("should not bomb if container is passed", function() {
    new radical("this is a dom node");
  });

  it("should bomb if container not is passed", function(done) {
    try {
      new radical
    } catch(e) {
      done()
    }
  });
});

describe("rendered month", function() {
  it("should return current match current month/year", function() {
    var tmp = new radical("this is a dom node");
    var renderedMonth = tmp.renderedMonth();

    assert.deepEqual(renderedMonth, {
      month: (new Date).getMonth(),
      year: (new Date).getFullYear()
    });
  });
});
