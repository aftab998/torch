import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class torch extends StatefulWidget {
  const torch({Key? key}) : super(key: key);

  @override
  State<torch> createState() => _torchState();
}

class _torchState extends State<torch> {
  final bgColor = const Color(0xff2C3333);
  final textColor = const Color(0xffE7F6F2);
  var isActive = false;
  var controller = TorchController();
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Torch Lite",style: TextStyle(color: textColor),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(isActive ? "assets/on.jpg" : "assets/off.jpg",
                    width: 200,
                    height: 20,
                    color: isActive ? null : textColor.withOpacity(0.2),
                  ),
                  SizedBox(
                    height: size.height*0.1,
                  ),
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 45,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                        onPressed: (){
                          controller.toggle();
                          isActive= !isActive;
                          setState(() {

                          });
                        },
                        icon: const Icon(Icons.power_settings_new),
                      ),
                    ),
                  )

                ],
              ),
            ),
          )),

          Text("Developed by AA",style: TextStyle(color: textColor,fontSize: 14.0),),
          SizedBox(
            height: size.height*0.05,
          ),
        ],
      ),
    );
  }
}
