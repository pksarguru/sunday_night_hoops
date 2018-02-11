$(document).ready(function() {
  $("#guests-button-down").click(function() {
    var num = parseInt($("#guests").val());

    if (num > 0) {
      num = num - 1;
    }

    $("#guests").val(num);
  })
})

$(document).ready(function() {
  $("#guests-button-up").click(function() {
    var num = parseInt($("#guests").val());

    num = num + 1;

    $("#guests").val(num);
  })
})
