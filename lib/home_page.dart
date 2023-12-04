import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:phonenumber/otp_screen.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RoundedLoadingButtonController sendCodeBtnController =
      RoundedLoadingButtonController();

  signinWhithphone() async{
    await Future.delayed(Duration(seconds: 2));
    sendCodeBtnController.success();
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OTPScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        title: const Text("Enter your Phone  number"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: CountryListPick(
                  theme: CountryTheme(
                      isShowFlag: true,
                      isShowTitle: true,
                      isShowCode: true,
                      showEnglishName: true),
                  initialSelection: "+98",
                  onChanged: (value) {
                    print(value?.name);
                  },
                  pickerBuilder:
                      (BuildContext context, CountryCode? countryCode) {
                    if (CountryCode != null) {
                      countryController.text = countryCode!.dialCode!;
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.7))),
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset(
                              countryCode!.flagUri!,
                              package: "country_list_pick",
                              width: 32,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              countryCode.name!,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                  useUiOverlay: true,
                  useSafeArea: true,
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.withOpacity(0.7))),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: TextField(
                      controller: countryController,
                      enabled: false,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  Text(
                    "",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "000 0000 0000",
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        border: InputBorder.none),
                  )),
                  SizedBox(
                    height: 25,
                  ),

                ],
              ),
            ),         SizedBox(
              height: 25,
            ),
            RoundedLoadingButton(
                controller: sendCodeBtnController,
                onPressed: ()=>signinWhithphone(),
                child: Text("Send code"))
          ],
        ),
      ),
    );
  }
}
