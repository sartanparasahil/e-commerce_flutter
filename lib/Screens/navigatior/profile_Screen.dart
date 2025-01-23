import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/profile_Model.dart';


class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {

  String? userName;
  String? userEmail;

  fetchUserData() async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();{
      setState(() {
        userName  = sharedPref.getString("USERNAME");
        userEmail = sharedPref.getString("USER-EMAIL");
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserData();
  }

  List<profileModel> profileList = [
    profileModel(const Icon(Icons.security,color: Colors.grey,), "Privacy"),
    profileModel(const Icon(Icons.history,color: Colors.grey,), "Purchase History"),
    profileModel(const Icon(Icons.help_outline,color: Colors.grey,), "Help & Support"),
    profileModel(const Icon(Icons.settings_outlined,color: Colors.grey,), "Settings"),
    profileModel(const Icon(Icons.person,color: Colors.grey,), "Invite a Friend"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    // color: Colors.orange,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              image: DecorationImage(image: AssetImage("assets/profile_image.jpg"),fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 14,
                          right: 14,
                          child: Container(
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow.shade700,
                            ),
                            child: const Center(child: Icon(Icons.edit,size: 16,)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text("$userName",style: TextStyle(color: Theme.of(context).highlightColor,fontSize: 15,fontWeight: FontWeight.bold),),
                const SizedBox(height: 2,),
                Text("$userEmail",style: TextStyle(color: Theme.of(context).hintColor,fontSize: 12,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade700,
                    fixedSize: const Size(200, 40),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  child: const Text("Upgrade to PRO",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 13),),
                ),
                const SizedBox(height: 20,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: profileList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 8),
                      child: Container(
                        height: 54,
                        width: MediaQuery.of(context).size.width.toDouble(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).cardColor,
                        ),
                        child: Center(
                          child: ListTile(
                            trailing: Icon(Icons.navigate_next,color: Theme.of(context).highlightColor,),
                            leading: profileList[index].itemIcon,
                            title: Text(profileList[index].itemname,style: TextStyle(color: Theme.of(context).highlightColor,fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => onBoarding(),),  (route) => false,);
                    },
                    child: Container(
                      height: 54,
                      width: MediaQuery.of(context).size.width.toDouble(),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Icon(Icons.logout_rounded,color: Theme.of(context).highlightColor,),
                          title: Text("Logout",style: TextStyle(color: Theme.of(context).highlightColor,fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    }
}