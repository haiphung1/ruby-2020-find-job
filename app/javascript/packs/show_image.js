$(function() {
  $('#profile_avatar').change(function(e) {
    $('#profile-image').attr('src', URL.createObjectURL(e.target.files[0]));
  })
})  
