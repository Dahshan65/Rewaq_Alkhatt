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
      title: 'رواق الخط العربي',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF5F0E6),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9A741F),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> openWhatsApp() async {
    final uri = Uri.parse(
      'https://wa.me/962779221235',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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

              const Icon(
                Icons.auto_stories,
                size: 85,
                color: Color(0xFF9A741F),
              ),

              const SizedBox(height: 15),

              const Text(
                'رِواق الخط العربي',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6F5318),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'بإشراف وائل دهشان',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.edit,
                        size: 55,
                        color: Color(0xFF9A741F),
                      ),

                      const SizedBox(height: 15),

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
                        'تعلم خط النسخ خطوة بخطوة من خلال مجموعة من المحاضرات التعليمية.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 22),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.play_arrow),
                          label: const Text(
                            'الدخول إلى الدورة',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CoursePage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.chat),
                  label: const Text('التواصل عبر WhatsApp'),
                  onPressed: openWhatsApp,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'رِواق الخط العربي © وائل دهشان',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(
                20,
                55,
                20,
                25,
              ),
              color: const Color(0xFF9A741F),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'رِواق الخط العربي',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'بإشراف وائل دهشان',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('الرئيسية'),
              onTap: () => Navigator.pop(context),
            ),

            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('دورة خط النسخ'),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CoursePage(),
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
                    builder: (_) => const AboutPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  static const List<Map<String, String>> lessons = [
    {
      'number': '01',
      'title': 'المحاضرة الأولى',
      'video': 'REPLACE_VIDEO_ID_1',
    },
    {
      'number': '02',
      'title': 'المحاضرة الثانية',
      'video': 'REPLACE_VIDEO_ID_2',
    },
    {
      'number': '03',
      'title': 'المحاضرة الثالثة',
      'video': 'REPLACE_VIDEO_ID_3',
    },
    {
      'number': '04',
      'title': 'المحاضرة الرابعة',
      'video': 'REPLACE_VIDEO_ID_4',
    },
    {
      'number': '05',
      'title': 'المحاضرة الخامسة',
      'video': 'REPLACE_VIDEO_ID_5',
    },
    {
      'number': '06',
      'title': 'المحاضرة السادسة',
      'video': 'REPLACE_VIDEO_ID_6',
    },
    {
      'number': '07',
      'title': 'المحاضرة السابعة',
      'video': 'REPLACE_VIDEO_ID_7',
    },
    {
      'number': '08',
      'title': 'المحاضرة الثامنة',
      'video': 'REPLACE_VIDEO_ID_8',
    },
    {
      'number': '09',
      'title': 'المحاضرة التاسعة',
      'video': 'REPLACE_VIDEO_ID_9',
    },
    {
      'number': '10',
      'title': 'المحاضرة العاشرة',
      'video': 'REPLACE_VIDEO_ID_10',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('محاضرات دورة خط النسخ'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'تحسين الكتابة بخط النسخ بالقلم العادي',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'اختر المحاضرة التي تريد مشاهدتها',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 20),

            ...lessons.map(
              (lesson) => LessonCard(
                number: lesson['number']!,
                title: lesson['title']!,
                videoId: lesson['video']!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonCard extends StatelessWidget {
  final String number;
  final String title;
  final String videoId;

  const LessonCard({
    super.key,
    required this.number,
    required this.title,
    required this.videoId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),

        leading: CircleAvatar(
          backgroundColor: const Color(0xFF9A741F),
          child: Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),

        subtitle: const Text(
          'اضغط لمشاهدة المحاضرة',
        ),

        trailing: const Icon(
          Icons.play_circle_fill,
          color: Color(0xFF9A741F),
          size: 34,
        ),

        onTap: () {
          if (videoId.startsWith('REPLACE')) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'سيتم إضافة رابط هذه المحاضرة في الخطوة التالية.',
                ),
              ),
            );
            return;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VideoPage(
                videoId: videoId,
                title: title,
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoPage extends StatefulWidget {
  final String videoId;
  final String title;

  const VideoPage({
    super.key,
    required this.videoId,
    required this.title,
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
      videoId: widget.videoId,
      autoPlay: false,
      params: const YoutubePlayerParams(
        showFullscreenButton: true,
        showControls: true,
        enableCaption: false,
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          children: [
            YoutubePlayer(
              controller: controller,
              aspectRatio: 16 / 9,
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('عن وائل دهشان'),
          centerTitle: true,
        ),
        body: const Padding(
          padding: EdgeInsets.all(25),
          child: Column(
            children: [
              SizedBox(height: 30),

              Icon(
                Icons.person,
                size: 90,
                color: Color(0xFF9A741F),
              ),

              SizedBox(height: 20),

              Text(
                'وائل دهشان',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15),

              Text(
                'معلم للغة العربية والخط العربي، '
                'ومشرف على رِواق الخط العربي.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
