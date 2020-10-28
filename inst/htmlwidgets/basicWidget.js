HTMLWidgets.widget({

  name: 'basicWidget',

  type: 'output',

  factory: function(el, width, height) {
      // TODO: define shared variables for this instance
    return {
      renderValue: function(x) {
        el.innerText = x.message;
        },

      resize: function(width, height) {
        // TODO: code to re-render the widget with a new size
        }

    };
  }
});
