import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:legacy_cinema/services/home.service.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var movieList = [].obs;
  var movie = [].obs;
  var commingSoonList = [].obs;
  var currentSlideshowIndex = 0.obs;
  var movieId = "".obs;
  List<Widget> slideshowList = [];
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchMovie() async {
    try {
      isLoading(true);
      var movies = await HttpService.fetchMovieByID(movieId.toString());
      if (movies == 401) {
        Get.offNamed('/login');
        return;
      } else {
        movie.value = movies;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchData() async {
    try {
      isLoading(true);
      movieList.value = [];
      commingSoonList.value = [];
      var movies = await HttpService.fetchMovies();
      var slideshows = await HttpService.fetchSlideshows();
      if (movies == 401) {
        Get.offNamed('/login');
        return;
      } else {
        for (var element in slideshows) {
          slideshowList.add(Image.network(
              "${PublicUsed.apiEndPoint}/${element.poster!}?w=100&h=40"));
        }
        for (var i = 0; i < movies.length; i++) {
          if (movies[i].releaseDate!.isBefore(DateTime.now()) == true) {
            movieList.add(movies[i]);
          } else {
            commingSoonList.add(movies[i]);
          }
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
