import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:festival_post_maker/models/festival_models.dart';
import 'package:festival_post_maker/utils/extension.dart';
import 'package:festival_post_maker/utils/routes.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    FestivalModels festival =
        ModalRoute.of(context)!.settings.arguments as FestivalModels;

    return Scaffold(
      body: Stack(
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
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Text(
                  festival.festivalName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                10.height,
                FanCarouselImageSlider.sliderType2(
                  imagesLink: (imageList: festival.detailing,).imageList,
                  isAssets: false,
                  sliderHeight: MediaQuery.of(context).size.height * 0.4,
                ),
                30.height,
                const Text(
                  "Description",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                2.height,
                Text(
                  festival.description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                10.height,
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Date ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      TextSpan(
                        text: "\t\t\t\t\t\t\t\t${festival.date}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                20.height,
                const Divider(
                  color: Colors.black,
                  thickness: 1.8,
                ),
                10.height,
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Region ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      TextSpan(
                        text: "\t\t\t${festival.region}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                20.height,
                const Divider(
                  color: Colors.black,
                  thickness: 1.8,
                ),
                10.height,
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Moral ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      TextSpan(
                        text: "\t\t\t\t\t\t${festival.moral}",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.editPage, arguments: festival);
        },
        backgroundColor: Colors.white10,
        child: const Icon(Icons.edit_sharp),
      ),
    );
  }
}
