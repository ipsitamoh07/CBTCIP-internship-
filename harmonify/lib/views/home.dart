// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harmonify/const/colors.dart';
import 'package:harmonify/const/text_style.dart';
import 'package:harmonify/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(
      PlayerController(),
    );

    return Scaffold(
      backgroundColor: bgDarkColor,
      appBar: AppBar(
        backgroundColor: bgDarkColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: whiteColor,
            ),
          )
        ],
        leading: Icon(
          Icons.sort_rounded,
          color: whiteColor,
        ),
        title: Text("Musicly",
            style: ourStyle(
              family: bold,
              size: 25,
            )),
      ),
      body: FutureBuilder<List<SongModel>>(
        future: controller.audioQuery.querySongs(
          ignoreCase: true, 
          orderType: OrderType.ASC_OR_SMALLER, 
          uriType: UriType.EXTERNAL, 
          sortType: null,
        ),
        builder: (BuildContext context, AsyncSnapshot<List<SongModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "No songs found",
                style: ourStyle(family: regular),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No songs found.",
                style: ourStyle(),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var song = snapshot.data![index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tileColor: bgColor,
                      title: Text(
                        snapshot.data![index].displayNameWOExt,
                        // song.title,
                        style: ourStyle(
                          family: bold,
                          size: 15,
                        ),
                      ),
                      subtitle: Text(
                        "${snapshot.data![index].artist}",
                        // song.artist ?? 'Unknown Artist',
                        style: ourStyle(
                          family: regular,
                          size: 12,
                        ),
                      ),
                      leading: Icon(
                        Icons.music_note,
                        color: whiteColor,
                        size: 32,
                      ),
                      trailing: Icon(
                        Icons.play_arrow,
                        color: whiteColor,
                        size: 26,
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
