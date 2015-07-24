$.MoviesIndex = function (el) {
  this.$el = $(el);
  this.genreCodes = {
    '28' : 'Action',
    '12' : 'Adventure',
    '16' : 'Animation',
    '35' : 'Comedy',
    '80' : 'Crime',
    '99' : 'Documentary',
    '18' : 'Drama',
    '10751' : 'Family',
    '14' : 'Fantasy',
    '10769' : 'Foreign',
    '36' : 'History',
    '27' : 'Horror',
    '10402' : 'Music',
    '9648' : 'Mystery',
    '10749' : 'Romance',
    '878' : 'Science Fiction',
    '10770' : 'TV Movie',
    '53' : 'Thriller',
    '10752' : 'War',
    '37' : 'Western'
  };

  $('select').on('change', function (e) {
    var $moviesList = $(this.$el.find('ul#main-list'));
    var selectedOption = $(event.target)
      .find('option:selected')
      .attr('value');
    switch(selectedOption) {
      case 'title':
        sortList($moviesList, byTitle);
        break;
      case 'date':
        sortList($moviesList, byDate);
        break;
      case 'genre':
        sortList($moviesList, byGenre);
        break;
    }
  }.bind(this));

  $.ajax({
    dataType: 'json',
    url: 'http://api.themoviedb.org/3/discover/movie?' +
      'with_cast=51576&sort_by=release_date.desc&' +
      'api_key=e505edada279c368d098a520d3fd7992',
    data: {},
    success: this.render.bind(this)
  });
};

$.MoviesIndex.prototype.render = function (data) {
  var tmpl = _.template(this.$el.find('script#template').html());
  $(this.$el.find('ul#main-list')).append(
    tmpl({
      movies: data.results,
      genreCodes: this.genreCodes
    })
  );
};

var byDate = function(first, second) {
  if ($(first).attr('data-date') > $(second).attr('data-date')) {
    return -1;
  } else {
    return 1;
  }
};

var byGenre = function(first, second) {
  if ($(first).attr('data-genre') < $(second).attr('data-genre')) {
    return -1;
  } else {
    return 1;
  }
};

var byTitle = function(first, second) {
  if ($(first).attr('data-title') < $(second).attr('data-title')) {
    return -1;
  } else {
    return 1;
  }
};

var sortList = function ($moviesList, sortBy) {
  var $list = $moviesList;
  var $items = $moviesList.children('li');
  $items.sort(sortBy);
  $.each($items, function (idx, itm) {
    $list.append(itm);
  });
};

$.fn.moviesIndex = function () {
  return this.each(function () {
    new $.MoviesIndex(this);
  });
};

$(function() {
  $('div#movies-index').moviesIndex();
});
