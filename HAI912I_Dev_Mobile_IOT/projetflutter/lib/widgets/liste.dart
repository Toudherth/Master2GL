import 'package:flutter/material.dart';


class ListeSection extends StatefulWidget {
  @override
  _ListeSectionState createState() => _ListeSectionState();
}

class _ListeSectionState extends State<ListeSection> {
  late ScrollController _scrollController;
  Axis _listScrollDirection = Axis.horizontal;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >= 100) { // Seuil de défilement
      setState(() {
        _listScrollDirection = Axis.vertical;
      });
    } else {
      setState(() {
        _listScrollDirection = Axis.horizontal;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      decoration: BoxDecoration(
        color: Colors.white70, // Fond blanc pour ce conteneur
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 16),
          Center(
            child: Icon(
              Icons.keyboard_arrow_up,
              color: Colors.black,
              size: 34,
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24),
              child: Text(
                'History',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5, // Le nombre d'éléments dans la liste
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        '30°',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000),
                        ),
                      ),
                      SizedBox(width: 8), // Espace entre le texte et l'icône
                      Image.asset(
                        'assets/page-1/images/sun-Y1q.png',
                        fit: BoxFit.cover,
                        width: 50, // La taille de l'image
                        height: 50,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


@override
void dispose() {
  _scrollController.dispose();
  super.dispose();
}
}
