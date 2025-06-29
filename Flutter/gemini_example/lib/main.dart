import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String apiKey = dotenv.env["GEMINI_API_KEY"]!;

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HostPage());
  }
}

class HostPage extends StatefulWidget {
  const HostPage({super.key});

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  TextEditingController controller = TextEditingController();
  String response = "";
  bool isLoading = false;
  late final GenerativeModel model;
  @override
  void initState() {
    super.initState();
    model = GenerativeModel(model: "gemini-2.0-flash", apiKey: apiKey);
  }

  Future<void> sendPrompt() async {
    if (controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Lütfen prompt giriniz!"),
          showCloseIcon: true,
          duration: Duration(milliseconds: 500),
        ),
      );
      return;
    }
    debugPrint("1");
    setState(() {
      isLoading = true;
      response = "Cevap veriliyor...";
    });
    try {
      final modelResponse = await model.generateContent([
        Content.text(controller.text),
      ]);
      setState(() {
        response = modelResponse.text ?? "Yanıt alınamadı!";
      });
    } catch (e) {
      setState(() {
        response = "Hata: ${e.toString()}";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          spacing: 12,
          children: [
            SizedBox(width: 24, child: Image.asset("images/logo.png")),
            Text("Gemini API Kullanımı"),
          ],
        ),
        foregroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Divider(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 15,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Prompt Giriniz",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  controller.text = "";
                                });
                              },
                              icon: Icon(Icons.clear),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (!isLoading) {
                            sendPrompt();
                          }
                        },
                        child: Text("Geminiye Sor"),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Visibility(
                          visible: isLoading,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      SizedBox(width: 12),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("Sonuç burada görünecek\n\n$response"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
