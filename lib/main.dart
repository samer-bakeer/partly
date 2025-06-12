import 'package:flutter/material.dart';

void main() => runApp(PartlyApp());

class PartlyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partly',
      theme: ThemeData(
        primaryColor: Color(0xFFFFA000),
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
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color primary = Color(0xFFFFA000);
  final Color secondary = Colors.orange[300]!;

  String? selectedBrand;
  String? selectedModel;
  String? selectedYear;

  final Map<String, List<String>> modelsByBrand = {
    'تويوتا': ['كورولا', 'كامري', 'هايلوكس'],
    'هيونداي': ['النترا', 'سوناتا', 'توسان'],
    'كيا': ['سيراتو', 'سبورتاج'],
  };

  final Map<String, List<String>> yearsByModel = {
    'كورولا': ['2020', '2021', '2022'],
    'كامري': ['2019', '2020'],
    'هايلوكس': ['2018', '2019'],
    'النترا': ['2020', '2023'],
    'سوناتا': ['2021'],
    'توسان': ['2022'],
    'سيراتو': ['2020'],
    'سبورتاج': ['2019', '2021'],
  };

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
          buildCarSelector(),
          SizedBox(height: 16),
          _buildImageUploadButton(),
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

  Widget buildCarSelector() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("اختر السيارة:",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: primary)),
            SizedBox(height: 10),
            ExpansionTile(
              title: Text(selectedBrand != null
                  ? "$selectedBrand / $selectedModel / $selectedYear"
                  : 'اختر الماركة'),
              children: modelsByBrand.keys.map((brand) {
                return ExpansionTile(
                  title: Text(brand),
                  children: modelsByBrand[brand]!.map((model) {
                    return ExpansionTile(
                      title: Text(model),
                      children: (yearsByModel[model] ?? []).map((year) {
                        return ListTile(
                          title: Text(year),
                          onTap: () {
                            setState(() {
                              selectedBrand = brand;
                              selectedModel = model;
                              selectedYear = year;
                            });
                            Navigator.pop(context);
                          },
                          selected: selectedBrand == brand &&
                              selectedModel == model &&
                              selectedYear == year,
                          selectedTileColor: Colors.orange[50],
                        );
                      }).toList(),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            if (selectedBrand != null &&
                selectedModel != null &&
                selectedYear != null)
              Text(
                'تم اختيار: $selectedBrand / $selectedModel / $selectedYear',
                style: TextStyle(
                    color: Colors.green[700], fontWeight: FontWeight.w600),
              )
          ],
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
}
