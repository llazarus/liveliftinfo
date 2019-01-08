$(document).ready(function() {
  if ($ .cookie("popup_1_2") == null) {
    $('#info-modal').modal('show');
    $ .cookie("popup_1_2", "2");
  }
});