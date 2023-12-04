import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController pin1Controller = TextEditingController(),
      pin2Controller = TextEditingController(),
      pin3Controller = TextEditingController(),
      pin4Controller = TextEditingController(),
      pin5Controller = TextEditingController(),
      pin6Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme
            .of(context)
            .scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Enter Your Verifictin Code",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall),
            SizedBox(
              height: 20,
            ),
            Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: pin1Controller,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15),
                          hintText: '0',
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.15),

                            ),


                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                          )
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
