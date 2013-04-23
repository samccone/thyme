# Radical
### a less crappy calendar renderer

#### API

```js
  myCalendar = new Radical({
    container: containerNode
  });

  // jump to and render next/prev month
  myCalendar.nextMonth();
  myCalendar.prevMonth();

  // gets a specific day's dom node
  myCalendar.getDay('11'); // dom element

  // get's the currently displayed month and year
  myCalendar.getRenderedMonth(); // returns { month: 5, year: 2013 }

  // jump and render the containing dates month
  myCalendar.render(date); //Moment.js valid date object

```
