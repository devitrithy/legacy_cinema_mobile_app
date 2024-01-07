import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/services/home.service.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var movieList = [].obs;
  var seatList = [].obs;
  var showingTimeList = [].obs;
  var locationList = ['All Cinemas'].obs;
  var commingSoonList = [].obs;
  var currentSlideshowIndex = 0.obs;
  var showingId = "".obs;
  var movieIndex = 0.obs;
  var selectOptionLocation = 'All Cinemas'.obs;
  List<Widget> slideshowList = [];
  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchSeat() async {
    try {
      isLoading(true);
      seatList.value = [];
      var seats = await HttpService.fetchSeat(showingId.value);
      if (seats == 401) {
        Get.offNamed('/login');
        return;
      } else {
        for (var location in seats) {
          locationList.add(location.locationName);
        }
        showingTimeList.value = seats;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchLocations() async {
    try {
      isLoading(true);
      showingTimeList.value = [];
      locationList.value = ['All Cinemas'];
      var movies = await HttpService.fetchShowingTime(
          movieList[movieIndex.value].movieId);
      if (movies == 401) {
        Get.offNamed('/login');
        return;
      } else {
        for (var location in movies) {
          locationList.add(location.locationName);
        }
        showingTimeList.value = movies;
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
      slideshowList = [];
      var movies = await HttpService.fetchMovies();
      var slideshows = await HttpService.fetchSlideshows();
      if (movies == 401) {
        Get.offNamed('/login');
        return;
      } else {
        for (var element in slideshows) {
          slideshowList.add(Image.network(
              "${PublicUsed.apiEndPoint}/thumbnail/${element.poster!.split('\\')[1]}?w=400&h=100"));
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
