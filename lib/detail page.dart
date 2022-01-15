import 'package:flutter/material.dart';
import 'package:ui1/data.dart';
import 'constant.dart';

class detailPage extends StatefulWidget {
  final PlanetInfo planetInfo;

  detailPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  final ScrollController _scrollcontroller = ScrollController();
  double scrollPosition = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollcontroller.addListener(() {
      setState(() {
        scrollPosition = _scrollcontroller.offset;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Planet Information",
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ))),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollcontroller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 300,
                        ),
                        Text(widget.planetInfo.name,
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 56,
                                fontWeight: FontWeight.w900,
                                color: primaryTextColor),
                            textAlign: TextAlign.left),
                        Text('Solar System',
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 31,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.left),
                        const Divider(),
                        const SizedBox(height: 32),
                        Text(
                          widget.planetInfo.description,
                          //maxLines: 5,
                          //overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 20,
                              color: contentTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 32),
                        const Divider(),
                        Text('Gallery',
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 31,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.left),
                        SizedBox(
                          height: 250,
                          //padding: const EdgeInsets.only(left: 32.0),
                          child: ListView.builder(
                              itemCount: widget.planetInfo.images.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      widget.planetInfo.images[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -64,
              child: IgnorePointer(
                child: AnimatedOpacity(
                  opacity: (scrollPosition < 2) ? 1 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Hero(
                      tag: widget.planetInfo.position,
                      child: Image.asset(widget.planetInfo.iconImage)),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 32,
              child: Text(widget.planetInfo.position.toString(),
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 185,
                      fontWeight: FontWeight.w900,
                      color: primaryTextColor.withOpacity(0.08)),
                  textAlign: TextAlign.left),
            ),
          ],
        ));
  }
}
