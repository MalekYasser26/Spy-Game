
import 'dart:math';

import 'package:flutter/material.dart';

class SharedLogic extends ChangeNotifier{
int playerNum = 1 ;
int pc=0 , sc = 0 ;
int spyCount = 0 ;
int min = 0 ;
List<String> places = [
  "البيت", "مدرسة", "الشارع", "كنيسة", "مطعم", "سوبرماركت",
  "مسجد", "شاطئ", "جامعة", "مكتب", "محطة", "متحف",
  "فندق", "السينما","الطريق السريع",
  "المطار", "قسم الشرطة", "السجن","قصر","النار","ملعب","حفلة عيد ميلاد",
  "الاهرامات","سلم الجامعة","سفينة","طيارة","بار"
];
List<String> instructions =[
  "اللعبه مكونة من جواسيس او سكان عاديين",
  "اول لاعب بياخد الموبايل و يشوف دوره ويديه للي جنبه",
  "الأدوار بتتوزع بشكل عشوائي",
  "مهمة السكان انهم يعرفوا مين الجاسوس اللي فيهم",
  "مهمة الجاسوس انه يعرف المكان من غير ما يتقفش",
  "طول الوقت اللي اتحدد بتسألوا بعض اسألة اجابتها اه او لا",
  "مينفعش نفس الشخص يتسأل مرتين ورا بعض",
  "لما الوقت بيخلص بتصوتوا علي بعض",
  "كل واحد عنده صوت واحد بس فخليك ناصح وانت بتختار",
  "لو اغلبية الاصوات علي الجاسوس يبقي السكان فازوا",
  "لو الاغلبية مش علي الجاسوس فلازم يقول الجاسوس المكان صح عشان يفوز",
  "لو الجاسوس قال المكان غلط و السكان صوتوا غلط محدش بيفوز",
];
late var placeRND = places[(Random().nextInt(places.length+1))];






}