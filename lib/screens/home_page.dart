import 'package:chat_bot_app/utils/app_constanta.dart';
import 'package:flutter/material.dart';

import '../utils/util_helper.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBlack,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(text: TextSpan(
                  text: "Dig" , style: mTextStyle16(mColor: Colors.orangeAccent),
                  children: [
                    TextSpan(
                      text: " IT", style:  mTextStyle16(mColor: Colors.white)
                    )
                  ]
                )),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: AppColors.greyBlack,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(Icons.person),
                )
              ],
            ),
            SizedBox(height: 11,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.messenger_outline,color: Colors.white,size: 16,),
                Text(" New Chat",style: mTextStyle12(mColor: Colors.white),),
                Expanded(
                  child: SizedBox(
                    width:11
                  ),
                ),
                Icon(Icons.history,color: Colors.grey,size: 16,),
                Text(" History",style: mTextStyle12(mColor: Colors.grey),),
              ],
            ),
            SizedBox(height: 21,),
            TextField(
              controller: queryController,
              onSubmitted: (value){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(query: value)));
              },
              onEditingComplete: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(query: queryController.text)));
              },
              style: mTextStyle12(mColor: Colors.grey),
              minLines: 5,
              maxLines: 5,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(query: queryController.text)));
                  },
                    child: Icon(Icons.send_rounded,color: Colors.grey,)),
                fillColor: AppColors.secondaryBlack,
                filled: true,
                hintText: " Write Question!",
                hintStyle: mTextStyle12(mColor: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(21)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(21)
                )
              ),
            ),
            SizedBox(height: 21,),
            SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: AppConstants.defaultQuestions.length,
                  itemBuilder: (_,index){
                return InkWell(
                  onTap: (){
                    selectedIndex = index;
                    setState(() {

                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 11),
                    height: 20,
                    width: 125,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryBlack,
                      borderRadius: BorderRadius.circular(5),
                      border: selectedIndex == index ? Border.all(
                        color: Colors.green,
                        width: 1
                      ) : Border.all(
                        width: 0
                      )
                    ),
                    child: Center(child: Text(AppConstants.defaultQuestions[index]['title'],style: mTextStyle16(mColor: selectedIndex == index ? Colors.green : Colors.white),)),
                  ),
                );
              }),
            ),
            SizedBox(height: 11,),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: AppConstants.defaultQuestions[selectedIndex]['ques'].length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 4),
                  itemBuilder: (_,index){
                  Map<String,dynamic> currItem = AppConstants.defaultQuestions[selectedIndex]['ques'][index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(query: currItem['ques'])));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryBlack,
                          borderRadius: BorderRadius.circular(21)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                      margin: EdgeInsets.symmetric(vertical: 11),
                                    height:50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: currItem['color'],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(child: Icon(currItem['icon'],color: Colors.white,size: 32,))),
                                ),
                              ),
                              Expanded(child: Text(currItem['ques'],style: mTextStyle16(mColor: Colors.white,mFontWeight: FontWeight.w900),))
                            ],
                          ),
                        ),
                      ),
                    );
              }),
            )
          ],
        ),
      )
    );
  }
}
