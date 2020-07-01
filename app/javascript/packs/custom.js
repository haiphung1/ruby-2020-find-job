$(document).on("turbolinks:load", function(){
  $(document).ready(function(){
    setTimeout(function(){
      $('#flash').remove();
    }, 4000);
  
    $(".check_bok_none").change(function(){
      console.log('123')
      $("input[type=hidden]").val(true);
    });
  });

  $(".check_bok_none").first.hide();
});
