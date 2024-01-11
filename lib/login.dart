import 'package:flutter/material.dart';
import 'package:todo/Home.dart';

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
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(25.0),
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
              padding: const EdgeInsets.only(left: 50,right: 50,top: 20,),
              child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(style: const ButtonStyle(backgroundColor:MaterialStatePropertyAll(Colors.purpleAccent)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                    child: const Text("LOGIN",style: TextStyle(color: Colors.white,fontSize: 20),),
                  )),
            ),
            const Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only( top: 20,left: 20,bottom: 50,right: 100),
                  child: Text("Forgot password?"),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
