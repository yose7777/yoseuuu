import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color mycolor;
  late Size mediaSize;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mycolor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: mycolor,
        image: DecorationImage(
            image: const AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(mycolor.withOpacity(0.2), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildtop()),
            Positioned(bottom: 0, child: _buildBotttom()),
          ],
        ),
      ),
    );
  }

  Widget _buildtop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.people,
            size: 100,
            color: Color.fromARGB(255, 93, 0, 255),
          ),
          Text(
            "SAFETY",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBotttom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "login pages",
          style: TextStyle(
            color: mycolor,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        _builGreytext("tolong login dengan informasi mu"),
        const SizedBox(height: 60),
        _builGreytext("masukan email"),
        _buildInputField(emailcontroller),
        const SizedBox(height: 40),
        _builGreytext("masukan password"),
        _buildInputField(passwordcontroller, isPassword: true),
        const SizedBox(height: 20),
        _buildRemembeForgot(),
        const SizedBox(height: 20),
        _buildLoginButton()
      ],
    );
  }

  Widget _builGreytext(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController Controller,
      {isPassword = false}) {
    return TextField(
      controller: Controller,
      decoration: InputDecoration(
          suffixIcon: isPassword
              ? Icon(Icons.remove_red_eye_outlined)
              : Icon(Icons.done)),
      obscureText: isPassword,
    );
  }

  Widget _buildRemembeForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            _builGreytext("ingat aku"),
          ],
        ),
        TextButton(onPressed: () {}, child: _builGreytext("liat password"))
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            elevation: 20,
            shadowColor: mycolor,
            minimumSize: const Size.fromHeight(60)),
        child: const Text("LOGIN"));
  }
}
