$.MoviesFilter = function (el) {
  this.$el = $(el);
  this.$el.on('keyup', function (e) {
    var input = this.$el.val();
    if (input !== '') {
      filterMovies(input);
    } else {
      showAll(this.$movieItems);
    }
  }.bind(this));
};

$.fn.moviesFilter = function () {
  return this.each(function () {
    new $.MoviesFilter(this);
  });
};

var filterMovies = function (substr) {
  var regex = new RegExp(substr, 'i');
  movieItems().each(function (i, movie) {
    var $movie = $(movie);
    var title = $movie.attr('data-title');
    if (title.search(regex) > -1) {
      $movie.removeClass('hide');
    } else {
      $movie.addClass('hide');
    }
  });
};

var movieItems = function () {
  return $('ul.main-list').children();
}

var showAll = function () {
  movieItems().each(function (i, movie) {
    $(movie).removeClass('hide');
  });
};
