import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/custom_text.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 25,backgroundColor:Colors.grey ,child: Icon(CupertinoIcons.person,color: Colors.white,),),
        Gap(15),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(7),

            const CustomText(
              text: "أهلا بك,عبدالرحمن",
              color: Colors.white,
              size: 23,
              weight: FontWeight.w500,
              fontFamily: "Cairo",
            ),
             Gap(1),

             Row(
               children: [
                 Icon(Icons.location_on_sharp,color: Colors.grey,size: 15,),
                 CustomText(
                  text: " جدة - حي الشاطئ",
                  color: Colors.grey,
                  size: 15,
                  weight: FontWeight.w500,
                   fontFamily: "Cairo",
                             ),
               ],
             ),

          ],
        ),
      ],
    );
    ;
  }
}
