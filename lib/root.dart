import 'package:flutter/material.dart';
import 'features/home/view/home_view.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _index = 0;

  // 🎨 الألوان
  Color get _bg => Colors.black;
  Color get _active => const Color(0xFFb5835a); // بني ناعم
  Color get _inactive => Colors.grey.shade500;

  // 🧭 التابات
  final List<_TabSpec> _tabs = const [
    _TabSpec(icon: Icons.home_rounded, label: 'الرئيسية'),
    _TabSpec(icon: Icons.explore_rounded, label: 'استكشف'),
    _TabSpec(icon: Icons.add, label: 'إضافة'), // الوسط (FAB)
    _TabSpec(icon: Icons.favorite_rounded, label: 'مفضلتي'),
    _TabSpec(icon: Icons.person_rounded, label: ' الشخصي'),
  ];

  // 📄 الصفحات
  late final List<Widget> _pages = [
    const HomeView(),
    const Center(child: Text('لا يوجد فيديوهات لعرضها', style: TextStyle(color: Colors.white,fontSize: 18))),
    const Center(child: Text('أضف شيئًا جديدًا', style: TextStyle(color: Colors.white))),
    const Center(child: Text('صفحة المفضلة', style: TextStyle(color: Colors.white))),
    const Center(child: Text('صفحة الملف الشخصي', style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      extendBody: true,

      // 🔹 الجسم (Body)
      body: SafeArea(
        child: IndexedStack(
          index: _index,
          children: _pages,
        ),
      ),

      // ⚡ زر الإضافة في المنتصف
      floatingActionButton: FloatingActionButton(
        onPressed: () => _setIndex(2),
        backgroundColor: _active,
        shape: const CircleBorder(),
        elevation: 6,
        tooltip: 'إضافة',
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // 🔻 شريط التبويب السفلي
      bottomNavigationBar: BottomAppBar(
        color: _bg,
        elevation: 12,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 70, // ✅ تقليل الارتفاع قليلاً لتوازن الشكل
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildNavItem(0),
              _buildNavItem(1),
              const SizedBox(width: 40), // مكان زر الإضافة
              _buildNavItem(3),
              _buildNavItem(4),
            ],
          ),
        ),
      ),
    );
  }

  // 🧩 عنصر التبويب
  Widget _buildNavItem(int i) {
    final bool isActive = _index == i;
    final spec = _tabs[i];

    return GestureDetector(
      onTap: () => _setIndex(i),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70, // ✅ تثبيت عرض لكل عنصر لتناسق أفضل
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // ✅ تمركز عمودي جميل
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              spec.icon,
              size: isActive ? 26 : 23,
              color: isActive ? _active : _inactive,
            ),
            const SizedBox(height: 3), // ✅ تباعد صغير متناسق
            Text(
              spec.label,
              style: TextStyle(
                fontFamily: 'Cairo',
                color: isActive ? _active : _inactive,
                fontSize: 11,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
                height: 1.1, // ✅ يقلل المسافة العمودية بين الأسطر
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  // 🔁 تغيير التبويب
  void _setIndex(int i) {
    if (_index != i) setState(() => _index = i);
  }
}

// 🧱 نموذج تفاصيل التبويب
class _TabSpec {
  final IconData icon;
  final String label;

  const _TabSpec({
    required this.icon,
    required this.label,
  });
}
