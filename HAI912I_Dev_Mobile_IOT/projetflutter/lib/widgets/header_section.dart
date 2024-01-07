import 'package:flutter/material.dart';
import 'dart:ui';


class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70),
              Text(
                'Montpellier',
                style: Theme.of(context).textTheme.headline3?.copyWith(color: Colors.white),
              ),
              SizedBox(height: 30),
              Text(
                '30°',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white, fontSize: 40),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Min | Max',
                        style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                      ),
                      Text(
                        '12° | 24°',
                        style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset(
                    'assets/page-1/images/sun-Y1q.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
              SizedBox(height: 190),
            ],
          ),
        );

  }
}
