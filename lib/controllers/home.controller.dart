import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:legacy_cinema/models/payment.model.dart';
import 'package:legacy_cinema/utils/components/shared/movie_card.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:legacy_cinema/models/showing_time.model.dart';
import 'package:legacy_cinema/models/showing_time_for_ticket.model.dart';
import 'package:legacy_cinema/models/ticket.model.dart';
import 'package:legacy_cinema/services/home.service.dart';
import 'package:legacy_cinema/utils/public_used.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

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
  List<Widget> popularMovieList = [];

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
        origin: "https://legacycinema.vercel.app",
        day: DateTime.now().day,
        uid: PublicUsed.getUserId(),
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
      popularMovieList = [];
      var movies = await HttpService.fetchMovies();
      if (movies == 401) {
        Get.offNamed('/login');
        return;
      } else {
        for (var i = 0; i < 5; i++) {
          popularMovieList.add(
            MovieCard(
              onTap: () {
                movieIndex.value = i;
                selectedImage.value = movieList[i].poster;
                Get.toNamed('/movie_detail');
              },
              image: "${PublicUsed.apiEndPoint}/${movies[i].poster}",
              title: movies[i].title,
              releaseDate: movies[i].releaseDate,
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

  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
          merchantDisplayName: 'Prospects',
          customerId: paymentIntentData!['customer'],
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
        ));
        displayPaymentSheet();
      }
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      List<ArrayDatas> arrayDatas =
          selectedSeatList.map((item) => ArrayDatas(seat: item)).toList();
      var res = await http.post(Uri.parse("${PublicUsed.apiEndPoint}/ticket"),
          body: json.encode(PaymentModel(
                  arrayDatas: arrayDatas,
                  uid: PublicUsed.getUserId(),
                  isBooking: true,
                  sid: showingTimeTicket.value.showingId)
              .toJson()),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${PublicUsed.getToken()}'
          });
      Get.snackbar(
        'Payment',
        'Payment Successful',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
      );
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
    } catch (e) {
      print("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51MlBeALmuduO7w8mHVrnHPSLTBt7ZGyXODIEyYUyKIgdCW0N6vwC4x6Nef6KcoTz76lHG11xho8ZCMKtK0vOheaQ00hhwHkSdD',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return json.decode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
