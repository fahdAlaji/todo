import 'package:flutter/material.dart';
import 'package:todo/Home.dart';
import 'package:todo/signup.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              height: 100,
              child: Image.asset('assets/images/ima.jpg')),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 211, 166, 219),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: TextField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.key,
                    color: Color.fromARGB(255, 211, 166, 219),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15, right: 0),
                  child: Checkbox(value: true, onChanged: (value) {}),
                ),
                const Text('Remember me?')
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 10,
              ),
              child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Color.fromARGB(255, 201, 90, 220))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Home()),
                      );
                    },
                    child: const Text(
                      "LOG IN",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 15, left: 20, bottom: 30, right: 100),
                  child: Text("Forgot password?"),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    )),
                Text("OR"),
                SizedBox(
                    width: 80,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.g_mobiledata,
                      color: Colors.red,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.facebook_rounded,
                      color: Colors.blue,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.insert_emoticon_sharp,
                      color: Colors.blue,
                    ))
              ],
            ),
             Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Need an account ?'),
                TextButton(onPressed: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SinUp()),
                      );
                },
                 child: Text("SIGN UP",style: TextStyle(color: Colors.black),))
              ],
            )
           
          ],
        ),
      ),
    );
  }
}
