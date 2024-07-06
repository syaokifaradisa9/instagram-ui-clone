import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget header(){
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 8
      ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/Logo.png",
            width: 112,
            height: 40,
          ),
          Row(
            children: [
              Image.asset(
                "assets/icons/Like.png",
                width: 25,
                height: 25,
              ),
              const SizedBox(width: 20),
              Image.asset(
                "assets/icons/Messenger.png",
                width: 25,
                height: 25,
              )
            ],
          )
        ]
      ),
    );
  }

  Widget post({
    required profileImagePath,
    required name,
    required postImagePath,
    required likeCount,
    required caption,
    required totalComment,
    required postDate,
  }){
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SizedBox(
                width: 34,
                height: 34,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Outer_Circle.png",
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage(
                        profileImagePath
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                name,
                style: GoogleFonts.roboto(
                  fontSize: 14
                ),
              ),
              const Spacer(),
              Image.asset(
                "assets/icons/More.png",
                width: 24,
                height: 24,
              )
            ],
          ),
        ),
        const SizedBox(height: 8),
        Image.asset(postImagePath),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/Like.png", width: 26, height: 26),
                  const SizedBox(width: 18),
                  Image.asset("assets/icons/Comment.png", width: 26, height: 26),
                  const SizedBox(width: 18),
                  Image.asset("assets/icons/Share.png", width: 26, height: 26),
                  const Spacer(),
                  Image.asset("assets/icons/Bookmark.png", width: 26, height: 26)
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "$likeCount likes",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: name,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14
                  ),
                  children: [
                    TextSpan(
                      text: " $caption",
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      )
                    )
                  ]
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "View all $totalComment comments",
                style: GoogleFonts.roboto(
                  color: Colors.black54
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    postDate,
                    style: GoogleFonts.roboto(
                      color: Colors.black54,
                      fontSize: 11
                    ),
                  ),
                  const SizedBox(width: 6,),
                  const FaIcon(
                    FontAwesomeIcons.solidCircle,
                    color: Colors.black54,
                    size: 3,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    "See translation",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8,)
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> posts = [
      {
        "profile_path": "assets/images/Profile.jpeg",
        "name": "syaokifaradisa09",
        'post_image_path': "assets/posts/Bali.jpg",
        "like_count": "99,999",
        'caption': "Bali",
        'total_comment': '9,999,999',
        'post_date': 'June 11'
      },
      {
        "profile_path": "assets/images/Profile.jpeg",
        "name": "syaokifaradisa09",
        'post_image_path': "assets/posts/Jepang.jpg",
        "like_count": "999,999",
        'caption': "Jepang",
        'total_comment': '9,999,999',
        'post_date': 'June 9'
      },
      {
        "profile_path": "assets/images/Profile.jpeg",
        "name": "syaokifaradisa",
        'post_image_path': "assets/posts/Turkey.jpg",
        "like_count": "999,999",
        'caption': "Turkey",
        'total_comment': '9,999,999',
        'post_date': 'June 1'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: SafeArea(child: header()),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index){
          return post(
            profileImagePath: posts[index]['profile_path'],
            name: posts[index]['name'],
            postImagePath: posts[index]['post_image_path'],
            likeCount: posts[index]['like_count'],
            caption: posts[index]['caption'],
            totalComment: posts[index]['total_comment'],
            postDate: posts[index]['post_date'],
          );
        }
      ),
    );
  }
}
