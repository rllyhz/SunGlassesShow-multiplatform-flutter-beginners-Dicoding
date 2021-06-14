class Movie {
  String title;
  String posterUrl;
  num rating;
  int year;

  Movie(this.title, this.posterUrl, this.year, this.rating);
}

var movieList = [
  Movie("Overlord", "assets/images/poster_overlord.jpg", 2017, 4.6),
  Movie("Overlord", "assets/images/poster_overlord.jpg", 2017, 5.2),
  Movie("Overlord", "assets/images/poster_overlord.jpg", 2017, 7.5),
  Movie("Overlord", "assets/images/poster_overlord.jpg", 2017, 5.6),
  Movie("Overlord", "assets/images/poster_overlord.jpg", 2017, 7.2)
];
