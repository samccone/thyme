# Thyme
a lightweight, minimal, and present-focused calendar renderer

[![Build Status](https://travis-ci.org/samccone/thyme.png)](https://travis-ci.org/samccone/thyme)

API
---

```js
  // renders a new calendar initialized at the current month
  myCalendar = new Thyme(document.getElementById('#cal'));

  // jump to and render next/prev month
  myCalendar.nextMonth();
  myCalendar.prevMonth();

  // gets a specific day's dom node (in the current month)
  myCalendar.getDay('11'); // returns dom element

  // get's the currently displayed month and year
  myCalendar.renderedMonth(); // returns { month: 5, year: 2013 }

  // jump and render the containing dates month
  myCalenday.currentDate = <date> //must be a valid date object
  myCalendar.render();
```


#### TESTING

`$ npm install mocha `    
`$ mocha test `
