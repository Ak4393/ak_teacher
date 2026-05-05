import 'package:flutter/material.dart';
import '../models/course.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myCourses = allCourses.where((c) => c.enrolled).toList();
    final completedCount = myCourses.where((c) => c.progress == 100).length;
    final totalLessons = myCourses.fold(0, (s, c) => s + c.lessonsCount);

    final achievements = [
      {'icon': '🏆', 'label': 'أول درس', 'earned': true},
      {'icon': '🔥', 'label': '7 أيام متتالية', 'earned': true},
      {'icon': '⭐', 'label': '10 دروس', 'earned': true},
      {'icon': '💎', 'label': 'كورس كامل', 'earned': true},
      {'icon': '🚀', 'label': '50 درس', 'earned': false},
      {'icon': '👑', 'label': 'خبير Flutter', 'earned': false},
    ];

    final settings = [
      {'icon': '🔔', 'label': 'الإشعارات', 'color': const Color(0xFF00B4D8)},
      {'icon': '🌙', 'label': 'الوضع الليلي', 'color': const Color(0xFFB388FF)},
      {'icon': '🌐', 'label': 'اللغة', 'color': const Color(0xFF06D6A0)},
      {'icon': '❓', 'label': 'مركز المساعدة', 'color': const Color(0xFFFFD166)},
      {'icon': '🚪', 'label': 'تسجيل الخروج', 'color': const Color(0xFFEF476F)},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A18),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF0A0A18), Color(0xFF12122A)],
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0xFF0077B6), Color(0xFF00B4D8)]),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF00B4D8).withOpacity(0.4),
                            blurRadius: 30,
                            offset: const Offset(0, 8),
                          )
                        ],
                      ),
                      child: const Center(
                        child: Text('👨‍💻', style: TextStyle(fontSize: 40)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'أحمد كريم',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '@ak_developer',
                      style: TextStyle(
                          color: Color(0xFF00B4D8),
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _StatItem(value: '${myCourses.length}', label: 'كورس'),
                        Container(width: 1, height: 30, color: const Color(0xFF2a2a40), margin: const EdgeInsets.symmetric(horizontal: 20)),
                        _StatItem(value: '$totalLessons', label: 'درس'),
                        Container(width: 1, height: 30, color: const Color(0xFF2a2a40), margin: const EdgeInsets.symmetric(horizontal: 20)),
                        _StatItem(value: '$completedCount', label: 'مكتمل'),
                      ],
                    ),
                  ],
                ),
              ),

              // Streak Card
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFFF6B35), Color(0xFFFFD166)]),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('السلسلة الحالية',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 4),
                            Text('7 أيام متتالية!',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900)),
                          ],
                        ),
                      ),
                      SizedBox(width: 14),
                      Text('🔥', style: TextStyle(fontSize: 40)),
                    ],
                  ),
                ),
              ),

              // Achievements
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'الإنجازات 🏅',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 14),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: achievements.length,
                      itemBuilder: (context, i) {
                        final a = achievements[i];
                        final earned = a['earned'] as bool;
                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: earned ? const Color(0xFF1C1C2E) : const Color(0xFF141420),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: earned
                                    ? const Color(0xFF2a2a40)
                                    : const Color(0xFF1a1a28)),
                          ),
                          child: Opacity(
                            opacity: earned ? 1.0 : 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(a['icon'] as String,
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: earned ? null : Colors.grey)),
                                const SizedBox(height: 6),
                                Text(
                                  a['label'] as String,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: earned
                                          ? Colors.white
                                          : const Color(0xFF555555),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Settings
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'الإعدادات',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 14),
                    ...settings.map((s) => Container(
                          margin: const EdgeInsets.only(bottom: 8),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1C2E),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFF2a2a40)),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.chevron_left,
                                  color: Color(0xFF444444), size: 20),
                              const Spacer(),
                              Text(
                                s['label'] as String,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: (s['color'] as Color).withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(s['icon'] as String,
                                      style: const TextStyle(fontSize: 18)),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value, label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900)),
        Text(label,
            style: const TextStyle(color: Color(0xFF888888), fontSize: 12)),
      ],
    );
  }
}
