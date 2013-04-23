radical = require("../radical");
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
