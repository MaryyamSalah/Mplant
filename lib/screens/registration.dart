import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mplant/screens/home_screen.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("asset/images/n.jpg"),
                fit: BoxFit.cover)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70, bottom: 32),
                      child: CircleAvatar(
                      
                      backgroundImage: AssetImage(
                        "asset/images/m.webp",
                      ),
                      radius: 60.0,
                    ),
                    ),
                    FormContainer(),
                    SignUpButton()
                  ],
                ),
                StaggerAnimationLogin(
                    controller:
                        _animationController // _animationController.view
                    )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class StaggerAnimationLogin extends StatelessWidget {

  late final AnimationController controller;

  StaggerAnimationLogin({required this.controller}) :
      buttonSqueeze = Tween(
        begin: 320.0,
        end: 60.0
      ).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.150)
        )
      ),
      buttonZoomOut = Tween(
        begin: 60.0,
        end: 1000.0
      ).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 1)//, curve: Curves.bounceInOut)
        )
      );

  late final Animation<double> buttonSqueeze;
  late final Animation<double> buttonZoomOut;

  Widget _buildAnimation(BuildContext context, Widget? child){
    return Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: InkWell(
          onTap: (){
            controller.forward();
          },
          child: Hero(
            tag: "fade",
            child:
            buttonZoomOut.value <= 60 ?
            Container(
                width: buttonSqueeze.value,
                height: 60,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Color(0xFF0C9869),
                    borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
                child: _buildInside(context)
            ) :
            Container(
              width: buttonZoomOut.value,
              height: buttonZoomOut.value,
              decoration: BoxDecoration(
                  color: const Color(0xFF0C9869),
                  shape: buttonZoomOut.value < 500 ?
                  BoxShape.circle : BoxShape.rectangle
              ),
            ),
          )
        ),
    );
  }

     Widget _buildInside(BuildContext context){
    if(buttonSqueeze.value > 75){
      return const Text('Sign Up',
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3
        ),
      );
    } else {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        strokeWidth: 1.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: _buildAnimation);
  }
}
      
class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
          child: Column(
            children: [
                InputField(
                    icon: Icons.person_outline,
                    hint: "Username",
                    obscure: false
                ),
                InputField(
                    icon: Icons.call_outlined,
                    hint: "Phone number",
                    obscure: true
                ),
                 InputField(
                    icon: Icons.email_outlined,
                    hint: "Email",
                    obscure: true
                ),
                 InputField(
                    icon: Icons.lock_outlined,
                    hint: "Password",
                    obscure: true
                ),
                 InputField(
                    icon: Icons.lock_outlined,
                    hint: "Confirm Password",
                    obscure: true
                ),
            ],
          ),
      ),
    );
  }
}
 
  
class InputField extends StatelessWidget {
  late final String hint;
  late final bool obscure;
  late final IconData icon;

  InputField({required this.icon,required this.hint,required this.obscure});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.green,width: 0.5)
        )
      ),
      child: TextFormField(
        obscureText: obscure,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(icon: Icon(icon,color: Colors.black,),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.black,fontSize: 15
            ),
         contentPadding: const EdgeInsets.only(top: 30,right: 30,bottom: 30,left: 5)
        ),
      ),
    );
  }
}


class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        padding: const EdgeInsets.only(top: 160),
        onPressed: (){
          Navigator.pushNamed(context, '/');
        },
        child: const Text(
          'Sign In',
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.black, shadows: <Shadow>[
      Shadow(
        offset: Offset(1.5, 1.0),
        blurRadius: 8.0,
        color: Colors.white,
      ),
     
    ],
  

            fontSize: 20,
            letterSpacing: 0.5
          ),
        )
    );
  }
}

 