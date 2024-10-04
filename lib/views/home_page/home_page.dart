import 'package:card_swiper/card_swiper.dart';
import 'package:festival_post_maker/festival_utils.dart';
import 'package:festival_post_maker/utils/extension.dart';
import 'package:festival_post_maker/utils/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Color> bgColor = [
  //   const Color(0xffffc8dd),
  //   const Color(0xffa2d2ff),
  //   const Color(0xff81b29a),
  //   const Color(0xffa8dadc),
  //   const Color(0xffcdb4db),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        autoplay: true,
        autoplayDisableOnInteraction: true,
        itemCount: allFestival.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(Routes.detailPage, arguments: allFestival[index]);
          },
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/image/1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    10.height,
                    SizedBox(
                      height: 350,
                      width: 350,
                      child: Image.network(
                        allFestival[index].thumbnail,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            // If loading is complete, return the image.
                            return child;
                          } else {
                            // While loading, show a CircularProgressIndicator.
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                    30.height,
                    Text(
                      "\t${allFestival[index].festivalName}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    25.height,
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "\t\tRegion ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          TextSpan(
                            text: "\t\t\t${allFestival[index].region}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    25.height,
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "\t\tMoral ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          TextSpan(
                            text: "\t\t\t\t\t${allFestival[index].moral}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
