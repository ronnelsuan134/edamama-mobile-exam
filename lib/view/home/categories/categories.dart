import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:15.0,top:0,right: 15.0,bottom: 15.0),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                elevation: 5.0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://placeimg.com/300/300/people',
                  fit: BoxFit.cover,
                  height: 55.0,
                  width: 55.0,
                ),
              ),
              const Text(
                'Fashion',
                style: TextStyle(
                  fontFamily: 'Poopins',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                elevation: 5.0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://placeimg.com/300/300/tech',
                  fit: BoxFit.cover,
                  height: 55.0,
                  width: 55.0,
                ),
              ),
              const Text(
                'Deals',
                style: TextStyle(
                  fontFamily: 'Poopins',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                elevation: 5.0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://placeimg.com/300/300/nature',
                  fit: BoxFit.cover,
                  height: 55.0,
                  width: 55.0,
                ),
              ),
              const Text(
                'Rewards',
                style: TextStyle(
                  fontFamily: 'Poopins',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Card(
                elevation: 5.0,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://placeimg.com/300/300/arch',
                  fit: BoxFit.cover,
                  height: 55.0,
                  width: 55.0,
                ),
              ),
              const Text(
                'Food',
                style: TextStyle(
                  fontFamily: 'Poopins',
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
