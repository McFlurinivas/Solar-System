import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ui1/constant.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ui1/data.dart';
import 'package:ui1/detail page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Explore',
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ))),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.3, 0.7])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: <Widget>[
                  DropdownButton<String>(
                      items: const [
                        DropdownMenuItem(
                          child: Text(
                            'Solar System',
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 24,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                      onChanged: (value) {},
                      icon: const Icon(
                        EvaIcons.arrowDown,
                        color: Colors.purple,
                      ),
                      underline: const SizedBox()),
                ],
              ),
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.only(left: 32),
              child: Swiper(
                itemCount: planets.length,
                itemWidth: MediaQuery
                    .of(context)
                    .size
                    .width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(activeSize: 20, space: 9),
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          PageRouteBuilder(pageBuilder: (context,a,b) => detailPage(
                            planetInfo: planets[index],
                          )));
                    },
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            const SizedBox(height: 100),
                            Card(
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32)),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(32.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 100),
                                    Text(planets[index].name,
                                        style: const TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 40,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left),
                                    Text(
                                      'Solar System',
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 23,
                                        color: primaryTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    const SizedBox(height: 32),
                                    Row(
                                      children: const <Widget>[
                                        Text(
                                          'Know more',
                                          style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 18,
                                              color: Color(0xffe4979e),
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.left,
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Color(0xFFE4979E),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Hero(
                          tag: planets[index].position,
                          child: Image.asset(planets[index].iconImage),
                        ),
                        Positioned(
                          right: 24,
                          bottom: 60,
                          child: Text(
                            planets[index].position.toString(),
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 200,
                              color: primaryTextColor.withOpacity(0.08),
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/menu_icon.png')),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/search_icon.png'))
          ],
        ),
      ),
    );
  }
}
