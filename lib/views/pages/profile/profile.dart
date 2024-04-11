part of '../page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    // final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneNumberController =
        TextEditingController();

    final User loggedInUser = userProvider.users.first;

    // Mengisi data pengguna ke dalam TextField
    // _usernameController.text = loggedInUser.username;
    _emailController.text = loggedInUser.email;
    _phoneNumberController.text = loggedInUser.noHP;
    _addressController.text = loggedInUser.alamat;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('profile'),
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
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '${loggedInUser.username}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
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
                  borderSide: BorderSide(
                      color: Colors.green), // Opsional: warna garis bawah
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                  borderSide: BorderSide(
                      color: Colors.green), // Opsional: warna garis bawah
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                  borderSide: BorderSide(
                      color: Colors.green), // Opsional: warna garis bawah
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 150, // Sesuaikan lebar sesuai kebutuhan
              height: 50, // Sesuaikan tinggi sesuai kebutuhan
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(10), // Mengatur ujung menjadi bulat
                color: Color(0xFF30E5D0), // Mengatur warna latar belakang
              ),
              child: TextButton(
                onPressed: null,
                child: Text(
                  'Update Profile',
                  style: TextStyle(
                      color: Colors.white, // Mengatur warna teks
                      fontSize: 15,
                      fontWeight: FontWeight
                          .w600 // Sesuaikan ukuran teks sesuai kebutuhan
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Logout',
              style: TextStyle(
                  color: Colors.black, // Mengatur warna teks
                  fontSize: 15,
                  fontWeight:
                      FontWeight.bold // Sesuaikan ukuran teks sesuai kebutuhan
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
