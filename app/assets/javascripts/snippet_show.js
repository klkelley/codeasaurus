$(document).ready(function() {
  var canWrite= !($("h2").text() === "Edit")
  var $codeArea;
  var editor;
  var $target = $('#markdown');
  var text = $target.text().trim()
  var converter = new showdown.Converter({omitExtraWLInCodeBlock: 'true'})
  var html = converter.makeHtml(text);
  $target.html(html);
  var $ace = $('#snippet');


    $('.edit-field.snippet > .edit_resource').on("submit", function(){
      event.preventDefault();
      console.log(editor.getSession().getValue());
      $codeArea.val(editor.getSession().getValue());
    });


  if ($ace.size() > 0) {
    $codeArea = $( "[name='resource[body]']" )
    editor = ace.edit("snippet");
    editor.setTheme("ace/theme/tomorrow_night");
    editor.getSession().setMode("ace/mode/ruby");
    // editor.getSession().setMode("ace/mode/javascript");


    editor.setReadOnly(canWrite);

  }

});
