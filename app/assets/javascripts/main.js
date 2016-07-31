$(function () {
  $('#new_video').fileupload({
    dataType: 'script',
    add: function (e, data) {
      $('#submit-video')
        .removeAttr('disabled')
        .click(function () {
          $('#submit-video').attr('value', 'Uploading...')
          data.submit();
        });
    },
    progressall: function(e, data) {
      // these things stolen from SO
      var progress = parseInt(data.loaded / data.total * 100, 10);
      $('.progress .bar').css('width', progress + '%')

      var remainingSeconds = (data.total - data.loaded) * 8 / data.bitrate;
      $('.progress .remaining-seconds')
        .css('display', 'block')
        .text(remainingSeconds + ' seconds remaining')
    },
    fail: function(e, data) {
      $('.errors')
        .text(data.jqXHR.responseText)
        .css('display', 'inline')
      $('#submit-video').attr('value', '   :(   ')
    },
    done: function(e, data) {
      $('#submit-video').attr('value', 'Uploaded!')
      $('.errors').css('display', 'none')
    }
  })
})
