$(document).ready(function(){

  $('#input_files').change(function(){
    $('.file_preview').hide();
    $('#attached_files_label').hide();
    $(this).show();
  });
  
});