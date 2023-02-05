import 'package:flutter/material.dart';

class Container_Widget extends StatelessWidget {
  const Container_Widget({Key? key, required this.prep_text}) : super(key: key);
final String prep_text ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.06,
      width: MediaQuery.of(context).size.width*0.4,
      decoration: BoxDecoration(color: Color(0xffe7e7e7),borderRadius: BorderRadius.circular(40)),
      child: Center(child: Text("$prep_text",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,),)),


    );
  }
}
