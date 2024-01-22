import 'package:flutter/material.dart';
import 'package:todo/Home.dart';
import 'package:todo/login.dart';

class SinUp extends StatelessWidget {
   SinUp({super.key});
TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [  SizedBox(
              width: 150,
              height: 100,
              child: Image.asset('assets/images/ima.jpg')),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Text(
                    "SIGN UP",
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
                    color: Colors.purpleAccent,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
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
                    color: Colors.purpleAccent,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 20,
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
                      "Sign up",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            ),
             const Padding( 
              padding: EdgeInsets.only(top: 50, bottom: 20),
              child: Row(
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
                const Text('Already a user?'),
                TextButton(onPressed: () {
                   Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Login()),
                      );
                }, child: const Text("LOGIN",style: TextStyle(color: Colors.black),))
              ],
            )
          ],
        ),
      ),
    );
  }
}