import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../models/planet.dart';
import '../widgets/custom_card.dart';

class Planets extends StatelessWidget {
  const Planets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Swiper(
              itemCount: planetInfo.length,
              itemWidth: MediaQuery.of(context).size.width,
              itemHeight: MediaQuery.of(context).size.height,
              layout: SwiperLayout.TINDER,
              pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.black,
                      activeColor: Colors.white,
                      activeSize: 12,
                      space: 4)),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        CustomCard(
                          name: planetInfo[index].name,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity, // set width to fill parent
                      height: 300,
                      child: Image.asset(planetInfo[index].iconImage),
                    )
                  ],
                );
              },
            )));
  }
}
