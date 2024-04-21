part of '../page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _addressController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    getUserData();
  }

  void getUserData() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final List<User> users = userProvider.users;
    if (users.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    final User loggedInUser = users.first;

    // Mengisi data pengguna ke dalam TextField
    _emailController.text = loggedInUser.email;
    _phoneNumberController.text = loggedInUser.noHP;
    _addressController.text = loggedInUser.alamat;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              child: Image(image: AssetImage('img/profil.png'), fit: BoxFit.cover)
              // decoration: BoxDecoration(
              //   image: DecorationImage(image: AssetImage('img/profil.png'), fit: BoxFit.fill),
              // ),
            ),
            SizedBox(height: 10),
            Text(
              '${loggedInUser.username}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'No. Handphone',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Alamat',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF30E5D0),
              ),
              child: TextButton(
                onPressed: () {
                  final user = User(
                    idUser: loggedInUser.idUser,
                    username: loggedInUser.username,
                    password: loggedInUser.password,
                    alamat: _addressController.text,
                    email: _emailController.text,
                    noHP: _phoneNumberController.text,
                    role: loggedInUser.role,
                  );
                  Provider.of<UserProvider>(context, listen: false)
                      .updateProfile(user)
                      .then((_) {
                    getUserData();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile updated successfully')),
                    );
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Failed to update profile: $error')),
                    );
                  });
                },
                child: Text(
                  'Update Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                // Tampilkan dialog konfirmasi sebelum logout
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Konfirmasi"),
                      content: Text("Apakah Anda yakin ingin keluar?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                          },
                          child: Text("Tidak", style: TextStyle(color: Color.fromARGB(255, 218, 54, 42))),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                            userProvider.logoutUser(context); // Lakukan logout
                          },
                          child: Text("Ya", style: TextStyle(color: Color.fromARGB(255, 63, 151, 66)),),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
