import 'package:flutter/material.dart';

import '../theme/constants.dart';

class CustomCard extends StatelessWidget {
  final String name;

  const CustomCard({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Avenir',
                      fontSize: 50),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "TimeBox",
                  style: TextStyle(
                      color: primaryTextColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Avenir',
                      fontSize: 28),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Know More",
                            style: TextStyle(
                                color: secondaryTextColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Avenir',
                                fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Icon(
                              Icons.arrow_forward,
                              color: secondaryTextColor,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                /*
                Ink(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Know More",
                          style: TextStyle(
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Avenir',
                              fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Icon(
                            Icons.arrow_forward,
                            color: secondaryTextColor,
                            size: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                )
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
