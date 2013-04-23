# Radical
a lightweight, minimal, and present-focused calendar renderer

API
---

```js
  // renders a new calendar initialized at the current month
  myCalendar = new Radical(document.getElementById('#cal'));

  // jump to and render next/prev month
  myCalendar.nextMonth();
  myCalendar.prevMonth();

  // gets a specific day's dom node (in the current month)
  myCalendar.getDay('11'); // returns dom element

  // get's the currently displayed month and year
  myCalendar.renderedMonth(); // returns { month: 5, year: 2013 }

  // jump and render the containing dates month
  myCalendar.render(date); // accepts moment.js valid date object
```
