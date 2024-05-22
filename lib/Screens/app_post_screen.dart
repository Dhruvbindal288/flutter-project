import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insta/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: IconButton(onPressed: () {}, icon: const Icon(Icons.upload_file)),
    // );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.swipe_left_alt)),
        title: const Text("Post to"),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Post',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://burst.shopifycdn.com/photos/two-tone-ink-cloud.jpg?width=1000&format=pjpg&exif=0&iptc=0'),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Write a caption..',
                    border: InputBorder.none,
                  ),
                  maxLines: 6,
                ),
              ),
              SizedBox(
                height: 46,
                width: 46,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://burst.shopifycdn.com/photos/two-tone-ink-cloud.jpg?width=1000&format=pjpg&exif=0&iptc=0'),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
