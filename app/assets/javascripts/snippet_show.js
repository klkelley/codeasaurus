$(document).ready(function() {
  var $target = $('#markdown')
  var text = $target.text()
  var converter = new showdown.Converter()
  var html = converter.makeHtml(text);
    $target.html(html);
})

var editor = ace.edit("snippet");
editor.setTheme("ace/theme/tomorrow_night");
editor.getSession().setMode("ace/mode/ruby");
// editor.getSession().setMode("ace/mode/javascript");
editor.setReadOnly(true);