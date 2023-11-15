import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dynamic_color/dynamic_color.dart';

import 'theme/color_schemes.g.dart';
import 'theme/custom_color.g.dart';

import 'model/home_coffee_model.dart';
export 'model/home_coffee_model.dart';

void main() => runApp(const EspressoLauncher());

class EspressoLauncher extends StatelessWidget {
  const EspressoLauncher({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightScheme = lightDynamic.harmonized();
          lightCustomColors = lightCustomColors.harmonized(lightScheme);

          // Repeat for the dark color scheme.
          darkScheme = darkDynamic.harmonized();
          darkCustomColors = darkCustomColors.harmonized(darkScheme);
        } else {
          // Otherwise, use fallback schemes.
          lightScheme = lightColorScheme;
          darkScheme = darkColorScheme;
        }

        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightScheme,
            extensions: [lightCustomColors],
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkScheme,
            extensions: [darkCustomColors],
          ),
          home: const HomeCoffeeWidget(),
        );
      },
    );
  }
}

class HomeCoffeeWidget extends StatefulWidget {
  const HomeCoffeeWidget({Key? key}) : super(key: key);

  @override
  _HomeCoffeeWidgetState createState() => _HomeCoffeeWidgetState();
}

class _HomeCoffeeWidgetState extends State<HomeCoffeeWidget> {
  late HomeCoffeeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => HomeCoffeeModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (isiOS) {
    //   SystemChrome.setSystemUIOverlayStyle(
    //     SystemUiOverlayStyle(
    //       statusBarBrightness: Theme.of(context).brightness,
    //       systemStatusBarContrastEnforced: true,
    //     ),
    //   );
    // }

    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(),
        child: Directionality(
            textDirection:
                TextDirection.ltr, // Set the appropriate text direction
            child: DynamicColorBuilder(
                builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
              ColorScheme lightScheme;
              ColorScheme darkScheme;

              if (lightDynamic != null && darkDynamic != null) {
                lightScheme = lightDynamic.harmonized();
                lightCustomColors = lightCustomColors.harmonized(lightScheme);

                // Repeat for the dark color scheme.
                darkScheme = darkDynamic.harmonized();
                darkCustomColors = darkCustomColors.harmonized(darkScheme);
              } else {
                // Otherwise, use fallback schemes.
                lightScheme = lightColorScheme;
                darkScheme = darkColorScheme;
              }

              return Scaffold(
                key: scaffoldKey,
                backgroundColor: const Color(0xFFF1F4F8),
                appBar: AppBar(
                  backgroundColor: const Color(0xFFF1F4F8),
                  automaticallyImplyLeading: false,
                  title: const Text("Home",
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFF14181B),
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      )),
                  actions: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Container(
                        width: 60,
                        height: 60,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1489980557514-251d61e3eeb6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTR8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  centerTitle: false,
                  elevation: 0,
                ),
                body: SafeArea(
                  top: true,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 16, 0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x25090F13),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Good Morning",
                                              style: TextStyle(
                                                fontFamily: 'Outfit',
                                                // color: Color(0xFF14181B),
                                                fontSize: 24,
                                                fontWeight: FontWeight.normal,
                                              )),
                                          Text("Summary of your weekly brews",
                                              style: TextStyle(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF57636C),
                                                fontSize: 18,
                                                fontWeight: FontWeight.normal,
                                              )),
                                          Divider(
                                            height: 24,
                                            thickness: 2,
                                            color: Color(0xFFF1F4F8),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Daily Coffees",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        )),
                                                    Text("1",
                                                        style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          // color: Color(0xFF14181B),
                                                          fontSize: 36,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Avg. Rating",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          // color: Color(0xFF14181B),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        )),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text("4.6",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Outfit',
                                                              // color: Color(0xFF14181B),
                                                              fontSize: 36,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            )),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      0, 0, 0),
                                                          child: Icon(
                                                            Icons.star_rounded,
                                                            color: Color(
                                                                0xFF57636C),
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 0, 0),
                                  child: Text("Daily Lessons",
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF57636C),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                                ListView(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 12, 16, 0),
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x411D2429),
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 1, 1, 1),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1574914629385-46448b767aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bGF0dGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                                    width: 70,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 4, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "How to pour Latte Art",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF14181B),
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 8, 0),
                                                        child: Text(
                                                            "A wonderfully delicious 2 patty melt that melts into...",
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Plus Jakarta Sans',
                                                              color: Color(
                                                                  0xFF14181B),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Color(0xFF57636C),
                                                      size: 24,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 8),
                                                    child: Text("2m",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              16, 12, 16, 0),
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x411D2429),
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 1, 1, 1),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1610874150308-a1e6f8c905d9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cG91ciUyMG92ZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                                    width: 70,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 4, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("How to brew coffee",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF14181B),
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          )),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 8, 0),
                                                        child: Text(
                                                            "Learn how to brew a delicious pourover every morning",
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Plus Jakarta Sans',
                                                              color: Color(
                                                                  0xFF14181B),
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Icon(
                                                      Icons
                                                          .chevron_right_rounded,
                                                      color: Color(0xFF57636C),
                                                      size: 24,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 8),
                                                    child: Text("2m",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 12, 0, 0),
                                  child: Text("Your latest coffee",
                                      style: TextStyle(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: Color(0xFF57636C),
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 44),
                                  child: ListView(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(16, 0, 16, 0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 7,
                                                color: Color(0x2F1D2429),
                                                offset: Offset(0, 3),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(12, 12, 12, 12),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Image.network(
                                                    'https://images.unsplash.com/photo-1607109793514-3075a25f6040?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHBvdXIlMjBvdmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                                                    width: double.infinity,
                                                    height: 140,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 8),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        "Burbon",
                                                        style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF14181B),
                                                          fontSize: 24,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Meters ",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "Roast",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        "Region",
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF57636C),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          "1,850",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF14181B),
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "Medium",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF14181B),
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          "Atitlan",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF14181B),
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 0, 16, 16),
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                /*Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.bottomToTop, // Use the PageTransition package for custom transitions
                      child: BrewCoffeeScreen(),
                    ),
                  );*/
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty
                                    .all<Color>(const Color.fromARGB(
                                        255,
                                        80,
                                        117,
                                        131)), // Set the desired background color
                                minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(double.infinity, 50)),
                                elevation: MaterialStateProperty.all<double>(3),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              icon: const Icon(
                                Icons.coffee_maker,
                                size: 15,
                                color: Colors.white,
                              ),
                              // Add space between icon and text
                              label: const Text(
                                "Brew Now",
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                ),
                              ),
                            )),
                      ]),
                ),
              );
            })));
  }
}
