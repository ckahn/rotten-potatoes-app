$.ReviewCompose = function (el) {
  this.$el = $(el);
  this.$el.on('submit', function (e) {
    e.preventDefault();
    var params = $(e.target).serializeJSON();
    saveReview(params);
  })
};

var addToList = function (params) {
  $list = $('ul.movie-show-reviews');
  location.reload();
};

var saveReview = function (params) {
  $.ajax({
    method: 'POST',
    url: '/reviews',
    dataType: 'json',
    data: params,
    success: addToList,
    error: showError
  });
};

var showError = function (resp) {
  var error_msg = resp.responseJSON[0];
  alert(error_msg);
};

$.fn.reviewCompose = function () {
  this.each(function () {
    new $.ReviewCompose(this);
  })
};
