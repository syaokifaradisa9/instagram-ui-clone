import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  Widget header({ required username }){
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        children: [
          Text(
            username,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 18
            ),
          ),
          const Spacer(),
          Image.asset(
            "assets/icons/Threads.png",
            width: 26,
            height: 26,
          ),
          const SizedBox(width: 16),
          Image.asset(
            "assets/icons/Add.png",
            width: 26,
            height: 26,
          ),
          const SizedBox(width: 16),
          const Icon(
            Icons.menu
          )
        ],
      ),
    );
  }

  Widget profileStatistic({ required String title, required String count }){
    return Column(
      children: [
        Text(
          count,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600
          )
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
            fontSize: 13,
            color: Colors.black
          ),
        )
      ],
    );
  }

  Widget profileDescriptionSection({ required name, required description }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 1),
        Text(
          description,
          style: GoogleFonts.roboto(
            fontSize: 13,
            color: Colors.black
          ),
        )
      ],
    );
  }

  Widget buttonContainer({required String title, required VoidCallback onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 8
        ),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(6))
        ),
        child: Text(
          title,
          style: GoogleFonts.roboto(
            color: Colors.black
          ),
        ),
      ),
    );
  }

  Widget buttonSection(){
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: buttonContainer(
            title: "Edit Profile",
            onTap: (){

            }
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          flex: 1,
          child: buttonContainer(
            title: "Share Profile",
            onTap: (){

            }
          ),
        )
      ],
    );
  }

  Widget storyHighlightItem({ required String coverPath, required String title }){
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: Colors.black38,
              width: 1.5
            )
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage(
              coverPath
            ),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          title,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 12
          ),
        )
      ],
    );
  }

  Widget addStoryHighlightItem(){
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: Colors.black38,
              width: 1.5
            )
          ),
          alignment: Alignment.center,
          child: FaIcon(FontAwesomeIcons.plus),
        ),
        Text(
          "New",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 12
          ),
        )
      ],
    );
  }

  Widget storyHighlightSection(){
    return Row(
      children: [
        storyHighlightItem(
          title: "Indonesian",
          coverPath: "assets/posts/Bali.jpg"
        ),
        const SizedBox(width: 18),
        storyHighlightItem(
          title: "Japan",
          coverPath: "assets/posts/Jepang.jpg"
        ),
        const SizedBox(width: 18),
        storyHighlightItem(
          title: "Turkey",
          coverPath: "assets/posts/Turkey.jpg"
        ),
        const SizedBox(width: 18),
        addStoryHighlightItem()
      ],
    );
  }

  Widget postTabItem({
    required String iconPath,
    required bool isActive,
    required Color iconColor
  }){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 11
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isActive ? Colors.black : Colors.transparent,
            width: 1.5
          )
        )
      ),
      child: Image.asset(
        iconPath,
        width: 23,
        height: 23,
        color: iconColor,
      ),
    );
  }

  Widget postsSection({ required List<String> postImagePaths }){
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: postTabItem(
                iconPath: "assets/icons/Grid.png",
                isActive: true,
                iconColor: Colors.black
              ),
            ),
            Flexible(
              flex: 1,
              child: postTabItem(
                iconPath: "assets/icons/Reels.png",
                isActive: false,
                iconColor: Colors.black38
              ),
            ),
            Flexible(
              flex: 1,
              child: postTabItem(
                iconPath: "assets/icons/Tags.png",
                isActive: false,
                iconColor: Colors.black,
              ),
            )
          ],
        ),
        Column(
          children: List.generate(
            (postImagePaths.length / 3).ceil(),
            (rowIndex){
              int startRowIndex = rowIndex * 3;
              return Row(
                children: List.generate(
                  3,
                  (columnIndex) => Flexible(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: postImagePaths.length > (startRowIndex + columnIndex)  ? Image.asset(
                          postImagePaths[startRowIndex + columnIndex],
                          fit: BoxFit.cover,
                        ) : const SizedBox(),
                      )
                    )
                  )
                )
              );
            }
          )
        )
      ],
    );
  }

  List<String> posts = [
    "assets/posts/Mekah.jpg",
    "assets/posts/Dubai.jpg",
    "assets/posts/France.jpg",
    "assets/posts/Jepang.jpg",
    "assets/posts/Turkey.jpg",
    "assets/posts/Bali.jpg",
    "assets/posts/Australia.jpg",
    "assets/posts/China.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: header(
            username: "syaokifaradisa09",
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 44,
                      backgroundImage: AssetImage(
                        "assets/images/Profile.jpeg"
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        profileStatistic(
                          count: "999K",
                          title: "Posts"
                        ),
                        const SizedBox(width: 34),
                        profileStatistic(
                          count: "999K",
                          title: "Followers"
                        ),
                        const SizedBox(width: 21),
                        profileStatistic(
                          count: "999K",
                          title: "Following"
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 12),
                profileDescriptionSection(
                  name: "Muhammad Syaoki Faradisa",
                  description: "Flutter & Fullstack Web Developer"
                ),
                const SizedBox(height: 15),
                buttonSection(),
                const SizedBox(height: 18),
                storyHighlightSection()
              ],
            ),
          ),
          postsSection(
            postImagePaths: posts
          )
        ],
      ),
    );
  }
}
