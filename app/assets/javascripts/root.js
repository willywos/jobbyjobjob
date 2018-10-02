function populateSearch(term) {
  document.getElementById('query').value = term;
  var elem = document.getElementById('searchForm');
  Rails.fire(elem, 'submit');
}
