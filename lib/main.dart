import 'package:flutter/material.dart';

void main() => runApp(PartlyApp());

class PartlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partly',
      theme: ThemeData(
        primaryColor: Color(0xFFFFA000), // اللون البرتقالي المائل للأصفر
        scaffoldBackgroundColor: Colors.grey[100],
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFFFA000),
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.orange[300],
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Color primary = Color(0xFFFFA000); // برتقالي مائل للأصفر
  final Color secondary = Colors.orange[300]!; // لون ثانوي

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partly', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.person_outline), onPressed: () {}),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildSearchBar(),
          SizedBox(height: 16),
          _buildImageUploadButton(),
          SizedBox(height: 24),
          _buildFilters(),
          SizedBox(height: 24),
          _buildPromoCard(),
          SizedBox(height: 24),
          _buildCarTypeSection(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey[600],
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'طلباتي'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'الإعدادات'),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'ابحث عن قطعة...',
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }

  Widget _buildImageUploadButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(Icons.camera_alt_outlined, color: Colors.white),
      label: Text("رفع صورة للتعرف على القطعة",
          style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  Widget _buildFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("تصفية حسب:",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: primary)),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: ['ماركة', 'موديل', 'سنة']
              .map((label) => FilterChip(
                    label: Text(label),
                    onSelected: (_) {},
                    selected: false,
                    backgroundColor: Colors.orange[100],
                    shape: StadiumBorder(side: BorderSide(color: secondary)),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildPromoCard() {
    return Card(
      color: Colors.orange[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.local_offer, color: Colors.orange[800]),
            SizedBox(width: 12),
            Expanded(
              child: Text('🔥 عروض خاصة على قطع تويوتا!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarTypeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("اختر نوع السيارة:",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: primary)),
        SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: ['تويوتا', 'هيونداي', 'كيا', 'BMW', 'مرسيدس', 'فورد']
              .map((name) => Container(
                    decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600)),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
