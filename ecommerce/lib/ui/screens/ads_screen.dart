import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'dart:developer' as developer;
import 'onboarding_screen.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({Key? key}) : super(key: key);

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => refreshIndicatorKey.currentState?.show());

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: scafoldBackground,
      body: RefreshIndicator(
        key: refreshIndicatorKey,
        onRefresh: _refresh,
        child: Center(
          child: _connectionStatus != ConnectivityResult.none
              ? Stack(
                  children: [
                    Container(
                      child: Image.network(
                        "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          "${AppConstants.error_image}",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 20,
                        right: 10,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OnBoardingScreen()));
                          },
                          child: Text('Skip',
                              style: boldWhite),
                          style: blackWithsize,
                        ))
                  ],
                )
              : Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: size.height * .25,
                            width: size.width * .5,
                            child: Image.asset(
                              "${AppConstants.appbar_image}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 28),
                            child: Text(
                              "Alpha Store",
                              style: titleStyle,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: size.height * .2,
                        width: size.width * .5,
                        child: Image.asset(
                          "${AppConstants.noconnection_image}",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: size.width * .5,
                        child: AutoSizeText(
                          "No Internet Connection",
                          style: titleStyle.copyWith(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          child: AutoSizeText(
                            "${AppConstants.offline_text}",
                            style: titleStyle.copyWith(fontSize: 18),
                            textAlign: TextAlign.center,
                          )),
                      InkWell(
                        onTap: () {
                          setState(() {
                            refreshIndicatorKey.currentState?.show();
                          });
                        },
                        child: Text("Try Again",
                            style: meduimStyl.copyWith(
                                fontSize: 20,
                                decoration: TextDecoration.underline)),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    AdsScreen();
  }
}
