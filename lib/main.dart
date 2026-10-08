import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

void main() {
  runApp(const RewaqApp());
}

class RewaqApp extends StatelessWidget {
  const RewaqApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'رِواق الخط العربي',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B6914),
          brightness: Brightness.light,
        ),
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const HomePage(),
    );
  }
}

// =====================================================
// بيانات المحاضرات
// =====================================================

class Lesson {
  final int number;
  final String title;
  final String videoId;

  const Lesson({
    required this.number,
    required this.title,
    required this.videoId,
  });
}

const List<Lesson> lessons = [
  Lesson(
    number: 1,
    title: 'إعلان دورة تحسين الكتابة بخط النسخ',
    videoId: '19vpZWc3GOg',
  ),
  Lesson(
    number: 2,
    title: 'الحروف المفردة بخط النسخ وتقسيماتها',
    videoId: 'uiDRjMCvbFY',
  ),
  Lesson(
    number: 3,
    title: 'التعريف بدورة تحسين الكتابة بخط النسخ',
    videoId: 'hfx1nwqD7oI',
  ),
  Lesson(
    number: 4,
    title: 'الحروف العامودية – الدرس العملي',
    videoId: 'UcvfRO46pO4',
  ),
  Lesson(
    number: 5,
    title: 'ميزان الحروف العامودية بالنقاط',
    videoId: '9C2Cuml-qIE',
  ),
  Lesson(
    number: 6,
    title: 'الحروف العامودية – المادة النظرية',
    videoId: 'gBowWq6FFzY',
  ),
  Lesson(
    number: 7,
    title: 'شرح طريقة كتابة اللام ألف (لأ)',
    videoId: 'YXBhWqJbojY',
  ),
  Lesson(
    number: 8,
    title: 'الحروف الكأسية – شرح نظري',
    videoId: '0c6MgEBZWHA',
  ),
  Lesson(
    number: 9,
    title: 'تطبيقات وتمارين الحروف الكأسية',
    videoId: 'rWIil56x7a8',
  ),
  Lesson(
    number: 10,
    title: 'الحروف الطبقية (ب، ف) والحروف ذات الأقواس (ح، غ)',
    videoId: 'eSdlhM7Lesw',
  ),
  Lesson(
    number: 11,
    title: 'تمارين الحروف الطبقية [ب، ت، ث، ف]',
    videoId: 'kLOrYsuQS7U',
  ),
  Lesson(
    number: 12,
    title: 'تمارين على الحروف (ج، ح، خ، ع، غ)',
    videoId: 'FdlwWzkMJyU',
  ),
  Lesson(
    number: 13,
    title: 'الأخطاء في كتابة الحروف الطبقية (ب، ف)',
    videoId: '8ClIFIrd7j0',
  ),
  Lesson(
    number: 14,
    title: 'الحروف (ر، و، م، د، هـ، ى)',
    videoId: 'UbMv3t7ZBQs',
  ),
  Lesson(
    number: 15,
    title: 'الحروف في أول ووسط وآخر الكلمة',
    videoId: 'jyvlnsGSKUA',
  ),
  Lesson(
    number: 16,
    title: 'الحروف في وسط الكلمة',
    videoId: '8jD6NIW36eU',
  ),
  Lesson(
    number: 17,
    title: 'الحروف في آخر الكلمة',
    videoId: 'pMVCnEWMDIE',
  ),
  Lesson(
    number: 18,
    title: 'خواص حرف النون والراء آخر الكلمة',
    videoId: '9P0bE23k0io',
  ),
  Lesson(
    number: 19,
    title: 'تمارين الحروف المفردة باستخدام الدوائر',
    videoId: 'wS9ympf4ocU',
  ),
  Lesson(
    number: 20,
    title: 'خواص حرف ج',
    videoId: '2oxuGHMWJxA',
  ),
];

// =====================================================
// الصفحة الرئيسية
// =====================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> openWhatsApp() async {
    final Uri url = Uri.parse(
      'https://wa.me/962779221235?text=${Uri.encodeComponent('السلام عليكم، أريد الاستفسار عن دورة الخط العربي مع وائل دهشان')}', 
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'رِواق الخط العربي',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      drawer: const AppDrawer(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const SizedBox(height: 20),

            // الشعار النصي
            const Icon(
              Icons.edit,
              size: 70,
              color: Color(0xFF8B6914),
            ),

            const SizedBox(height: 15),

            const Text(
              'رِواق الخط العربي',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'بإشراف وائل دهشان',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 35),

            // بطاقة الدورة
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [

                    const Text(
                      'تحسين الكتابة بخط النسخ بالقلم العادي',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'دورة متكاملة لتعلم أساسيات خط النسخ وتحسين الكتابة بطريقة عملية ومنظمة.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CoursePage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.menu_book),
                        label: const Text(
                          'الدخول إلى الدورة',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: openWhatsApp,
                        icon: const Icon(Icons.chat),
                        label: const Text(
                          'التواصل عبر واتساب',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'تعلم الخط العربي خطوة بخطوة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'شاهد المحاضرات بالترتيب وطبّق التمارين مع كل درس.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// القائمة الجانبية
// =====================================================

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF8B6914),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  size: 55,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'رِواق الخط العربي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'وائل دهشان',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('الرئيسية'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false,
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text('دورة خط النسخ'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CoursePage(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('عن وائل دهشان'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// =====================================================
// صفحة الدورة
// =====================================================

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دورة خط النسخ'),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: lessons.length,
        itemBuilder: (context, index) {

          final lesson = lessons[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 10),
            elevation: 2,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),

              leading: CircleAvatar(
                backgroundColor: const Color(0xFF8B6914),
                child: Text(
                  '${lesson.number}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              title: Text(
                lesson.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              trailing: const Icon(
                Icons.play_circle_fill,
                color: Color(0xFF8B6914),
                size: 35,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPage(
                      lesson: lesson,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// =====================================================
// صفحة الفيديو
// =====================================================

class VideoPage extends StatefulWidget {
  final Lesson lesson;

  const VideoPage({
    super.key,
    required this.lesson,
  });

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController.fromVideoId(
      videoId: widget.lesson.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        strictRelatedVideos: true,
        privacyEnhancedMode: true,
      ),
    );
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المحاضرة ${widget.lesson.number}',
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                widget.lesson.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 18),

            YoutubePlayer(
              controller: controller,
              aspectRatio: 16 / 9,
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'المحاضرة ${widget.lesson.number} من ${lessons.length}',
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black54,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('العودة إلى المحاضرات'),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// صفحة عن وائل دهشان
// =====================================================

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عن وائل دهشان'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [

            const Icon(
              Icons.person,
              size: 80,
              color: Color(0xFF8B6914),
            ),

            const SizedBox(height: 20),

            const Text(
              'وائل دهشان',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'مدرس ومهتم بالخط العربي وتعليم الكتابة العربية، '
              'ويقدم دروسًا ودورات متخصصة في تحسين الخط العربي.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                height: 1.8,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'رِواق الخط العربي',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'مساحة تعليمية لتعلم الخط العربي بأسلوب مبسط ومنظم.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
