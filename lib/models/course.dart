import 'package:flutter/material.dart';

class Lesson {
  final int id;
  final String title;
  final String duration;
  final bool isDone;
  final String type; // video, quiz, project

  const Lesson({
    required this.id,
    required this.title,
    required this.duration,
    required this.isDone,
    required this.type,
  });
}

class Course {
  final int id;
  final String title;
  final String subtitle;
  final String icon;
  final Color color;
  final Color accent;
  final String level;
  final String duration;
  final int lessonsCount;
  final double rating;
  final int students;
  final int progress;
  final bool enrolled;
  final List<Lesson> lessons;

  const Course({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.accent,
    required this.level,
    required this.duration,
    required this.lessonsCount,
    required this.rating,
    required this.students,
    required this.progress,
    required this.enrolled,
    required this.lessons,
  });
}

final List<Course> allCourses = [
  const Course(
    id: 1,
    title: 'Flutter من الصفر',
    subtitle: 'تعلم Flutter وبناء تطبيقات احترافية',
    icon: '📱',
    color: Color(0xFF00B4D8),
    accent: Color(0xFF0077B6),
    level: 'مبتدئ',
    duration: '12 ساعة',
    lessonsCount: 24,
    rating: 4.9,
    students: 3200,
    progress: 65,
    enrolled: true,
    lessons: [
      Lesson(id: 1, title: 'مقدمة في Flutter وDart', duration: '18 دق', isDone: true, type: 'video'),
      Lesson(id: 2, title: 'إعداد البيئة (VS Code + Android Studio)', duration: '22 دق', isDone: true, type: 'video'),
      Lesson(id: 3, title: 'الـ Widgets الأساسية', duration: '30 دق', isDone: true, type: 'video'),
      Lesson(id: 4, title: 'StatefulWidget vs StatelessWidget', duration: '25 دق', isDone: false, type: 'video'),
      Lesson(id: 5, title: 'التنقل بين الشاشات (Navigation)', duration: '20 دق', isDone: false, type: 'quiz'),
      Lesson(id: 6, title: 'إدارة الحالة مع Provider', duration: '35 دق', isDone: false, type: 'video'),
      Lesson(id: 7, title: 'HTTP Requests وAPI', duration: '40 دق', isDone: false, type: 'project'),
      Lesson(id: 8, title: 'نشر التطبيق على Google Play', duration: '28 دق', isDone: false, type: 'video'),
    ],
  ),
  const Course(
    id: 2,
    title: 'Python للمبتدئين',
    subtitle: 'أساسيات Python مع تطبيقات عملية',
    icon: '🐍',
    color: Color(0xFF06D6A0),
    accent: Color(0xFF028A60),
    level: 'مبتدئ',
    duration: '10 ساعات',
    lessonsCount: 20,
    rating: 4.8,
    students: 5100,
    progress: 0,
    enrolled: false,
    lessons: [
      Lesson(id: 1, title: 'مقدمة في Python', duration: '15 دق', isDone: false, type: 'video'),
      Lesson(id: 2, title: 'المتغيرات وأنواع البيانات', duration: '20 دق', isDone: false, type: 'video'),
      Lesson(id: 3, title: 'الشروط والحلقات', duration: '25 دق', isDone: false, type: 'quiz'),
      Lesson(id: 4, title: 'الدوال والوحدات', duration: '30 دق', isDone: false, type: 'video'),
      Lesson(id: 5, title: 'البرمجة الكائنية OOP', duration: '35 دق', isDone: false, type: 'project'),
    ],
  ),
  const Course(
    id: 3,
    title: 'JavaScript الحديث',
    subtitle: 'ES6+ وأحدث مميزات JavaScript',
    icon: '⚡',
    color: Color(0xFFFFD166),
    accent: Color(0xFFE6A817),
    level: 'متوسط',
    duration: '15 ساعة',
    lessonsCount: 30,
    rating: 4.7,
    students: 4400,
    progress: 30,
    enrolled: true,
    lessons: [
      Lesson(id: 1, title: 'مقدمة ES6+', duration: '18 دق', isDone: true, type: 'video'),
      Lesson(id: 2, title: 'Arrow Functions والـ Scope', duration: '22 دق', isDone: true, type: 'video'),
      Lesson(id: 3, title: 'Promises وAsync/Await', duration: '28 دق', isDone: false, type: 'video'),
      Lesson(id: 4, title: 'Destructuring والـ Spread', duration: '20 دق', isDone: false, type: 'quiz'),
      Lesson(id: 5, title: 'Modules وImport/Export', duration: '25 دق', isDone: false, type: 'project'),
    ],
  ),
  const Course(
    id: 4,
    title: 'React.js المتقدم',
    subtitle: 'Hooks, Context, وتحسين الأداء',
    icon: '⚛️',
    color: Color(0xFFEF476F),
    accent: Color(0xFFC1121F),
    level: 'متقدم',
    duration: '18 ساعة',
    lessonsCount: 36,
    rating: 4.9,
    students: 2800,
    progress: 0,
    enrolled: false,
    lessons: [
      Lesson(id: 1, title: 'مراجعة React Fundamentals', duration: '20 دق', isDone: false, type: 'video'),
      Lesson(id: 2, title: 'Custom Hooks', duration: '30 دق', isDone: false, type: 'video'),
      Lesson(id: 3, title: 'Context API المتقدم', duration: '35 دق', isDone: false, type: 'video'),
      Lesson(id: 4, title: 'Performance Optimization', duration: '40 دق', isDone: false, type: 'quiz'),
    ],
  ),
  const Course(
    id: 5,
    title: 'قواعد البيانات SQL',
    subtitle: 'من الأساسيات إلى الاستعلامات المعقدة',
    icon: '🗄️',
    color: Color(0xFFB388FF),
    accent: Color(0xFF7C3AED),
    level: 'مبتدئ',
    duration: '8 ساعات',
    lessonsCount: 16,
    rating: 4.6,
    students: 3700,
    progress: 100,
    enrolled: true,
    lessons: [
      Lesson(id: 1, title: 'مقدمة في قواعد البيانات', duration: '15 دق', isDone: true, type: 'video'),
      Lesson(id: 2, title: 'CREATE TABLE وأنواع البيانات', duration: '20 دق', isDone: true, type: 'video'),
      Lesson(id: 3, title: 'SELECT والاستعلامات', duration: '25 دق', isDone: true, type: 'quiz'),
      Lesson(id: 4, title: 'JOIN بين الجداول', duration: '30 دق', isDone: true, type: 'video'),
    ],
  ),
  const Course(
    id: 6,
    title: 'Git وGitHub',
    subtitle: 'التحكم بالإصدارات والعمل الجماعي',
    icon: '🔀',
    color: Color(0xFFFF9F1C),
    accent: Color(0xFFE07000),
    level: 'مبتدئ',
    duration: '6 ساعات',
    lessonsCount: 12,
    rating: 4.8,
    students: 6200,
    progress: 0,
    enrolled: false,
    lessons: [
      Lesson(id: 1, title: 'ما هو Git؟', duration: '12 دق', isDone: false, type: 'video'),
      Lesson(id: 2, title: 'أوامر Git الأساسية', duration: '25 دق', isDone: false, type: 'video'),
      Lesson(id: 3, title: 'Branching وMerging', duration: '30 دق', isDone: false, type: 'project'),
    ],
  ),
];
