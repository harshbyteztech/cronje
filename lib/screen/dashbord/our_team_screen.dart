import 'package:cronje/bloc/member/member_bloc.dart';
import 'package:cronje/bloc/member/member_state.dart';
import 'package:cronje/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import '../../bloc/member/member_event.dart';
import '../../model/member_model.dart';
import '../../utils/app_asset.dart';
import '../../utils/app_color.dart';
import '../../utils/text_style.dart';
import '../../widget/app_bar.dart';

class OurTeamScreen extends StatefulWidget {
  const OurTeamScreen({Key? key}) : super(key: key);

  @override
  State<OurTeamScreen> createState() => _OurTeamScreenState();
}

class _OurTeamScreenState extends State<OurTeamScreen> {
  List<Member> memberList = [];
  MemberBloc memberBloc = MemberBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    memberBloc = BlocProvider.of<MemberBloc>(context);
    memberBloc.add(MemberListGetEvent());
  }

  bool isExpande = false;
  List<int> listIndex = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                AppAssetsImage.logoBlack,
                height: 95.w,
                width: 80.w,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              children: [
                AppBarWidget(
                  backPress: false,
                  page: 0,
                ),
                SizedBox(
                  height: 10.w,
                ),
                Text(
                  strOurTeam,
                  style: TextStyleWidget.mediumTextStyle(fontSize: 6.w),
                ),
                SizedBox(
                  height: 7.w,
                ),
                Expanded(
                  child: BlocConsumer<MemberBloc, MemberListState>(
                    builder: (context, state) {
                      return state is MemberStateLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: mainColor,
                            ))
                          : ListView.builder(
                              padding: const EdgeInsets.all(5.0),
                              itemCount: memberList.length,
                              itemBuilder: (context, index) {
                                // listIndex.add(index);
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      memberList[index].isExpande =
                                          !memberList[index].isExpande;
                                      // for (int i = 0;
                                      //     i < memberList.length;
                                      //     i++) {
                                      //   if (memberList[index].isExpande ==
                                      //       true) {
                                      //     memberList[i].isExpande = false;
                                      //   } else {
                                      //     if (i == index) {
                                      //       memberList[i].isExpande = true;
                                      //     } else {
                                      //       memberList[i].isExpande = false;
                                      //     }
                                      //   }
                                      // }
                                    });
                                  },
                                  child: Card(
                                    margin: const EdgeInsets.all(10.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: whiteColor),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              child: Image.network(
                                                memberList[index].photo,
                                                height: 25.w,
                                                width: 25.w,
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (loadingProgress == null)
                                                    return child;
                                                  return SizedBox(
                                                    height: 25.w,
                                                    width: 25.w,
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: mainColor,
                                                        strokeWidth: 2.0,
                                                        value: loadingProgress
                                                                    .expectedTotalBytes !=
                                                                null
                                                            ? loadingProgress
                                                                    .cumulativeBytesLoaded /
                                                                loadingProgress
                                                                    .expectedTotalBytes!
                                                            : null,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    memberList[index].name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyleWidget
                                                        .boldTextStyle(
                                                            fontSize: 4.5.w,
                                                            height: 1.2),
                                                  ),
                                                  SizedBox(
                                                    height: 2.w,
                                                  ),
                                                  Text(
                                                    memberList[index]
                                                        .description,
                                                    maxLines: memberList[index]
                                                                .isExpande ==
                                                            false
                                                        ? 5
                                                        : 100,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyleWidget
                                                        .mediumTextStyle(
                                                            fontSize: 3.3.w,
                                                            height: 1.2),
                                                  ),
                                                  // ReadMoreText(
                                                  //   memberList[index]
                                                  //       .description,
                                                  //   style: TextStyleWidget
                                                  //       .regularTextStyle(
                                                  //       fontSize: 3.3.w,
                                                  //       height: 1.3),
                                                  //   trimLines: 3,
                                                  //   trimMode: TrimMode.Line,
                                                  //   trimCollapsedText: 'Read more',
                                                  //   trimExpandedText: ' Show less',
                                                  //   moreStyle: TextStyle(fontSize: 3.3.w, fontWeight: FontWeight.bold),
                                                  //   lessStyle: TextStyle(fontSize: 3.3.w, fontWeight: FontWeight.bold),
                                                  // ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    },
                    listener: (context, state) {
                      if (state is MemberStateSuccess) {
                        memberList = state.list!;
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
