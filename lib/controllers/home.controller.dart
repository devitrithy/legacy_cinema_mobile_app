import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/models/showing_time.model.dart';
import 'package:legacy_cinema/models/showing_time_for_ticket.model.dart';
import 'package:legacy_cinema/models/ticket.model.dart';
import 'package:legacy_cinema/services/home.service.dart';
import 'package:legacy_cinema/utils/public_used.dart';

class HomeController extends GetxController {
  var selectedImage = "".obs;
  var isLoading = true.obs;
  var movieList = [].obs;
  var seatList = [].obs;
  var selectedSeatList = [].obs;
  var showingTime = Showing().obs;
  var showingTimeList = [].obs;
  var showingTimeTicket = ShowingTimeTicketModel().obs;
  var commingSoonList = [].obs;
  var currentSlideshowIndex = 0.obs;
  var showingId = "".obs;
  var movieIndex = 0.obs;
  var selectOptionLocation = 'All Cinemas'.obs;
  var listOfDate = [].obs;
  var activeDate = DateTime.now().day.obs;
  List<Widget> slideshowList = [];

  @override
  void onInit() {
    fetchData();
    generateDate();
    super.onInit();
  }

  generateDate() {
    var currentDate = DateTime.now();
    listOfDate.value = [];
    for (var i = 0; i <= 4; i++) {
      listOfDate.add(currentDate.add(Duration(days: i)));
    }
  }

  void fetchSeat(String id) async {
    try {
      isLoading(true);
      selectedSeatList.value = [];
      var seats = await HttpService.fetchSeat(id);
      var showingTimes = await HttpService.fetchShowingTimeTicket(id);
      if (seats == 401) {
        Get.offNamed('/login');
        return;
      } else {
        seatList.value = seats;
        showingTimeTicket.value = showingTimes[0];
      }
    } finally {
      isLoading(false);
    }
  }

  void purchaseTicket() async {
    isLoading.value = true;
    List<TicketModel> items = [
      TicketModel(
        genre: showingTimeTicket.value.movie!.genre,
        origin: PublicUsed.global,
        day: DateTime.now().day,
        uid: PublicUsed.getUserId()["user_id"],
        mid: showingTimeTicket.value.movieId,
        seats: selectedSeatList
            .toString()
            .substring(1, selectedSeatList.toString().length - 1),
        sid: showingTimeTicket.value.showingId,
        id: showingTimeTicket.value.movie!.priceId,
        title: showingTimeTicket.value.movie!.title,
        qty: selectedSeatList.length,
        price: showingTimeTicket.value.movie!.priceId,
      )
    ];
    try {
      var res = await HttpService.purchaseTicket(items);
      if (await canLaunchUrl(Uri.parse(res.url))) {
        bool launchUrls = await launchUrl(Uri.parse(res.url));
        if (launchUrls) {
          selectedSeatList.value = [];
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchLocations(int date) async {
    try {
      isLoading(true);
      showingTimeList.value = [];
      var movies = await HttpService.fetchShowingTime(
          movieList[movieIndex.value].movieId, date);
      if (movies == 401) {
        Get.offNamed('/login');
        return;
      } else {
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
          slideshowList.add(
            CachedNetworkImage(
              imageUrl:
                  "${PublicUsed.apiEndPoint}/thumbnail/${element.poster!.split('\\')[1]}?w=400&h=100",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          );
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
