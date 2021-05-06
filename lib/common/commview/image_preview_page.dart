import 'package:zlocation/common/textstyle/textstyle.dart';
import 'package:flutter/material.dart';

class ImagePreviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(child: Image.asset('assets/preview.jpg', fit: BoxFit.fitWidth,)),
          Positioned(
            bottom: 15,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white10
                  ),
                  child: Text("X", style: AppFont.textStyle(20, color: Colors.white),),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}