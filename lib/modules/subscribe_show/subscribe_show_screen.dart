import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../modules/subscribe_show/subscribe_show_controller.dart';

class SubscribeShowScreen extends StatelessWidget {
  const SubscribeShowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return GetBuilder<SubscribeShowController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          elevation: 0,
          title: Text('Subscribe Show'),
        ),
        backgroundColor: Colors.white,
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "Subscribe your favorite Podcast Shows. Or you can do it later",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.shows.length,
                          itemBuilder: (BuildContext context, int index) {
                            final show = controller.shows[index];
                            return ListTile(
                              leading: Image(
                                image: NetworkImage(
                                  controller.shows[index].showImageUrl!,
                                ),
                              ),
                              title: Text(
                                show.showName ?? "",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.035,
                                  color: Colors.black,
                                ),
                              ),
                              trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: show.isSubscribe
                                      ? Colors.white
                                      : Color(0xFFAB3CFF),
                                  foregroundColor: show.isSubscribe
                                      ? Color(0xFFAB3CFF)
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () {
                                  controller.toggleShowSubscribe(show);
                                },
                                child: Text(
                                  show.isSubscribe ? 'Subscribed' : 'Subscribe',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Add skip button functionality
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle:
                                    TextStyle(fontSize: screenWidth * 0.045),
                                foregroundColor: Color(0xFFAB3CFF),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: BorderSide(
                                    color: Color(0xFFAB3CFF),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Text('Skip'),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                controller.sendShows();
                              },
                              style: ElevatedButton.styleFrom(
                                textStyle:
                                    TextStyle(fontSize: screenWidth * 0.045),
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFFAB3CFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: Text('Continue'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
