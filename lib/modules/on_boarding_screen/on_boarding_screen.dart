import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/form/default_button.dart';
import 'package:shop_app/shared/constants/styles/styles.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboard.png',
      title: 'On Board 1 title',
      body: 'On Board 1 body',
    ),
    BoardingModel(
      image: 'assets/images/onboard.png',
      title: 'On Board 2 title',
      body: 'On Board 2 body',
    ),
    BoardingModel(
      image: 'assets/images/onboard.png',
      title: 'On Board 3 title',
      body: 'On Board 3 body',
    ),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DefaultButton(
            function: submit,
            text: 'SKIP',
            textColors: defaultColor,
            isText: true,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding_20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                onPageChanged: (int index) {
                  if(index == boarding.length - 1)
                    {
                      setState(() {
                        isLast= true;
                      });
                    } else
                      {
                        setState(() {
                          isLast = false;
                        });
                      }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
                physics: BouncingScrollPhysics(),
              ),
            ),
            SizedBox(
              height: height_40 * 2,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: greyColor,
                    activeDotColor: defaultColor,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(isLast)
                    {
                      submit();
                    } else
                    {
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

void submit()
{
  CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
  ).then((value) {
    if(value)
      {
        navigateAndFinish(context, LoginScreen());
      }
  });
}
}

