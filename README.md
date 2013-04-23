# Radical
a lightweight and minimal calendar renderer

API
---

```js
  myCalendar = new Radical('#calendar');

  // jump to and render next/prev month
  myCalendar.nextMonth();
  myCalendar.prevMonth();

  // gets a specific day's dom node
  myCalendar.getDay('11'); // returns dom element

  // get's the currently displayed month and year
  myCalendar.renderedMonth(); // returns { month: 5, year: 2013 }

  // jump and render the containing dates month
  myCalendar.render(date); // accepts moment.js valid date object
```
