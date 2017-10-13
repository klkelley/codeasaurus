$(document).ready(function() {
  var $target = $('#markdown')
  var text = $target.text().trim()
  var converter = new showdown.Converter({omitExtraWLInCodeBlock: 'true'})
  var html = converter.makeHtml(text);
  $target.html(html);

  var $ace = $('#snippet')
  if ($ace.size() > 0) {
    var editor = ace.edit("snippet");
    editor.setTheme("ace/theme/tomorrow_night");
    editor.getSession().setMode("ace/mode/ruby");
    // editor.getSession().setMode("ace/mode/javascript");
    editor.setReadOnly(true);
  }

})
