$(function () {
  $('#new_video').fileupload({
    dataType: 'script',
    add: function (e, data) {
      data.context = $('#submit-video')
        .removeAttr('disabled')
        .click(function () {
          data.context = $('#submit-video').attr('value', 'Uploading...')
          // data.context = $('<p/>').text('Uploading...').replaceAll($(this));
          data.submit();
        });
    },
    progressall: function(e, data) {
      var progress = parseInt(data.loaded / data.total * 100, 10);
      $('.progress .bar').css('width', progress + '%')
    },
    fail: function(e, data) {
      // put up a notification!
    },
    done: function(e, data) {
      data.context = $('#submit-video')
        .attr('value', 'Uploaded!')
    }
  })
})
