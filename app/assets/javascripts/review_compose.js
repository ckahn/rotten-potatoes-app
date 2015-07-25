$.ReviewCompose = function (el) {
  this.$el = $(el);
  this.$el.on('submit', function (e) {
    e.preventDefault();
    var params = $(e.target).serializeJSON();
    saveReview(params);
  })
};

var saveReview = function (params) {
  $.ajax({
    method: 'POST',
    url: '/reviews',
    dataType: 'json',
    data: params,
    success: function () {
      console.log('SUCCESS');
    },
    error: function () {
      console.log('ERROR');
    }
  });
};

$.fn.reviewCompose = function () {
  this.each(function () {
    new $.ReviewCompose(this);
  })
};
