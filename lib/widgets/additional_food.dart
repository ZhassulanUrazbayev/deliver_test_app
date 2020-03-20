import 'package:deliver_test_app/models/additional_food_model.dart';
import 'package:flutter/material.dart';
import 'package:deliver_test_app/utils/constants.dart' as Constants;

Widget AdditionalFoodWidget(List<AdditionalFood> additionalFoods) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 42.0),
    child: ListView.builder(
      itemCount: additionalFoods.length,
      itemBuilder: (BuildContext context, int index) {
        AdditionalFood additionalFood = additionalFoods[index];
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(additionalFood.imageUrl),
                  backgroundColor: Colors.transparent,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              additionalFood.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            ),
                            Text(
                              "${additionalFood.price.toString()} ${Constants.rubleName}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15.0),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          additionalFood.description,
                          style: TextStyle(color: Colors.grey, fontSize: 15.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        );
      },
    ),
  );
}
