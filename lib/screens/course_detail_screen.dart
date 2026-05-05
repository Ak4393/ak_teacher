import 'package:flutter/material.dart';
import '../models/course.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;
  const CourseDetailScreen({super.key, required this.course});

  Color _typeColor(String type) {
    switch (type) {
      case 'quiz': return const Color(0xFFFFD166);
      case 'project': return const Color(0xFF06D6A0);
      default: return const Color(0xFF00B4D8);
    }
  }

  String _typeLabel(String type) {
    switch (type) {
      case 'quiz': return 'اختبار';
      case 'project': return 'مشروع';
      default: return 'فيديو';
    }
  }

  @override
  Widget build(BuildContext context) {
    final doneLessons = course.lessons.where((l) => l.isDone).length;
    final pct = course.lessons.isEmpty ? 0 : (doneLessons / course.lessons.length);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A18),
      body: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 48, 20, 28),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [course.accent, course.color],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('←',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(course.icon, style: const TextStyle(fontSize: 48)),
                  const SizedBox(height: 8),
                  Text(
                    course.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    course.subtitle,
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      '⭐ ${course.rating}',
                      '👥 ${course.students}',
                      '⏱ ${course.duration}',
                      '📚 ${course.lessonsCount} درس',
                    ].map((t) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            t,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          ),
                        )).toList(),
                  ),
                ],
              ),
            ),
          ),

          // Progress Card
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1C2E),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF2a2a40)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${(pct * 100).round()}%',
                          style: TextStyle(
                              color: course.color,
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                        ),
                        const Text(
                          'تقدمك في الكورس',
                          style: TextStyle(
                              color: Color(0xFFAAAAAA), fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: pct.toDouble(),
                        backgroundColor: const Color(0xFF2a2a40),
                        valueColor: AlwaysStoppedAnimation<Color>(course.color),
                        minHeight: 8,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$doneLessons من ${course.lessons.length} دروس مكتملة',
                      style: const TextStyle(
                          color: Color(0xFF777777), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Lessons Header
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'قائمة الدروس',
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 12)),

          // Lessons List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final lesson = course.lessons[i];
                  final tc = _typeColor(lesson.type);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: lesson.isDone
                          ? const Color(0xFF06D6A0).withOpacity(0.07)
                          : const Color(0xFF1C1C2E),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: lesson.isDone
                            ? const Color(0xFF06D6A0).withOpacity(0.25)
                            : Colors.transparent,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.play_circle_outline,
                            color: Color(0xFF555555), size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                lesson.title,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: lesson.isDone
                                      ? const Color(0xFF06D6A0)
                                      : Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: tc.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      _typeLabel(lesson.type),
                                      style: TextStyle(
                                          color: tc,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    lesson.duration,
                                    style: const TextStyle(
                                        color: Color(0xFF666666),
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: lesson.isDone
                                ? const Color(0xFF06D6A0)
                                : const Color(0xFF2a2a40),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              lesson.isDone ? '✓' : '${i + 1}',
                              style: TextStyle(
                                color: lesson.isDone
                                    ? Colors.white
                                    : const Color(0xFF888888),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: course.lessons.length,
              ),
            ),
          ),

          // Enroll Button
          if (!course.enrolled)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [course.accent, course.color]),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: course.color.withOpacity(0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      )
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      '🎓 ابدأ الكورس مجاناً',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}
