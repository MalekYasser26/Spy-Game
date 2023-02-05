
import 'package:flutter/material.dart';

class customInstappBar extends StatelessWidget implements PreferredSizeWidget {
  const customInstappBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      child:Row(
        children: [
          Expanded(child: Container(
            alignment: Alignment.topLeft,
            child: IconButton(onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);

            },
                icon: Icon(Icons.home,size: MediaQuery.of(context).size.height*0.037,
                  color: Colors.white,)),
            color: Color(0xff161616)
          )),
          Expanded(child: Container(
            color: Color(0xff818181).withOpacity(.2)
          ))
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
