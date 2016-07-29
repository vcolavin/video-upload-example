$(function () {
  $('#new_video').fileupload({
    // done: function(e, data){},
    dataType: "json",
    add: function (e, data) {
      $("#submit-video").on('click', function () {
          data.submit();
        })
      },
    progressall: function(e, data) {
      var progress = parseInt(data.loaded / data.total * 100, 10);
      $('.progress .bar').css('width', progress + '%')
    }
    // done: function(e, data) {
      // follow redirect
    // }
    }
  })
})
