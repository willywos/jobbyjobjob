function populateSearch(term) {
  document.getElementById('query').value = term;
  var elem = document.getElementById('searchForm');
  Rails.fire(elem, 'submit');
}

$(document).ready(function() {
  var flashTimeout;
  function setFlash() {
    flashTimeout = window.setTimeout(function() {
      $('.flash').slideToggle();
    }, 3000);
  }
  $('.flash').click(function() {
    window.clearTimeout(flashTimeout);
    $(this).slideUp();
  });
  $('.flash').show(function() {
    setFlash();
  });
});
