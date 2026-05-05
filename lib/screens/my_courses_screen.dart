import 'package:flutter/material.dart';
import '../models/course.dart';
import 'course_detail_screen.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myCourses = allCourses.where((c) => c.enrolled).toList();
    final completedCount = myCourses.where((c) => c.progress == 100).length;
    final avgProgress = myCourses.isEmpty
        ? 0
        : myCourses.fold(0, (s, c) => s + c.progress) ~/ myCourses.length;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A18),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                child: Text(
                  'كورساتي 📚',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),

            // Stats Row
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _StatCard(label: 'التقدم', value: '$avgProgress%', icon: '📈', color: const Color(0xFFFFD166)),
                    const SizedBox(width: 10),
                    _StatCard(label: 'مكتملة', value: '$completedCount', icon: '✅', color: const Color(0xFF06D6A0)),
                    const SizedBox(width: 10),
                    _StatCard(label: 'الكورسات', value: '${myCourses.length}', icon: '📗', color: const Color(0xFF00B4D8)),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    final course = myCourses[i];
                    final done = course.lessons.where((l) => l.isDone).length;
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CourseDetailScreen(course: course)),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1C2E),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: const Color(0xFF2a2a40)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    course.title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${course.lessonsCount} درس • ${course.duration}',
                                    style: const TextStyle(
                                        color: Color(0xFF666666), fontSize: 12),
                                  ),
                                  const SizedBox(height: 8),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: LinearProgressIndicator(
                                      value: course.progress / 100,
                                      backgroundColor: const Color(0xFF2a2a40),
                                      valueColor: AlwaysStoppedAnimation<Color>(course.color),
                                      minHeight: 6,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${course.progress}%',
                                        style: TextStyle(
                                            color: course.color,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        '$done/${course.lessons.length} دروس',
                                        style: const TextStyle(
                                            color: Color(0xFF555555),
                                            fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 14),
                            Container(
                              width: 52,
                              height: 52,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [course.accent, course.color]),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(course.icon,
                                    style: const TextStyle(fontSize: 26)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: myCourses.length,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label, value, icon;
  final Color color;
  const _StatCard({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF1C1C2E),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFF2a2a40)),
        ),
        child: Column(
          children: [
            Text(icon, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w900)),
            Text(label, style: const TextStyle(color: Color(0xFF555555), fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
