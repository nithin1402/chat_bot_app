import 'package:chat_bot_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/util_helper.dart';

class ChatPage extends StatefulWidget {
  String query;
  ChatPage({required this.query});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  List<MessageModel> listMsg  = [];
  DateFormat dateFormat = DateFormat.Hm();
  @override
  void initState() {
    super.initState();
    listMsg.add(MessageModel(msg: widget.query, sendId: 0, sentAt: DateTime.now().millisecondsSinceEpoch.toString()));
    listMsg.add(MessageModel(msg: "This is the response for you r query on the given question", sendId: 1, sentAt: DateTime.now().millisecondsSinceEpoch.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainBlack,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
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

                  //app icon
                  // Row(
                  //   children: [
                  //     Image.asset()
                  //   ],
                  // ),
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
              Expanded(child: ListView.builder(
                reverse: true,
                itemCount: listMsg.length,
                  itemBuilder: (context,index){
                return listMsg[index].sendId == 1 ? BotChatBox(listMsg[index]) : UserChatBox(listMsg[index]);
              })),
              TextField(
                style: mTextStyle12(mColor: Colors.grey),
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: (){

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
            ],
          ),
        ),
      ),
    );
  }

  //rightSideBox
  Widget UserChatBox(MessageModel msgModel){

    var time=dateFormat.format(DateTime.fromMillisecondsSinceEpoch(int.parse(msgModel.sentAt!)));
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.2,
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: AppColors.greyBlack,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(21),topRight: Radius.circular(21),bottomLeft: Radius.circular(21))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(child: Text("${msgModel.msg}",style: mTextStyle12(mColor: Colors.white),)),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text(time,style: mTextStyle10(mColor: Colors.white),)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  //leftSideBox
  Widget BotChatBox(MessageModel msgModel){
    var time=dateFormat.format(DateTime.fromMillisecondsSinceEpoch(int.parse(msgModel.sentAt!)));
    return Row(
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(21),topRight: Radius.circular(21),bottomRight: Radius.circular(21))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(child: Text("${msgModel.msg}",style: mTextStyle12(mColor: Colors.black),)),
                Text(time,style: mTextStyle10(mColor: Colors.black),),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.2,
        ),
      ],
    );
  }
}
