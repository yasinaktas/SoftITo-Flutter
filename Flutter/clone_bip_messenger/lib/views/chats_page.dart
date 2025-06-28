import 'package:clone_bip_messenger/models/chat.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List<Chat> chats = [
    Chat(
      name: "Yasin A.",
      time: "22.47",
      imagePath: "images/2.png",
      isRead: false,
      message: "Merhaba nasılsın? Bu deneme amaçlı yazılmış uzun bir yazıdır!",
    ),
    Chat(
      name: "Celal Serdar E.",
      time: "12.13",
      imagePath: "images/8.png",
      isRead: false,
      message: "Tasarım bitmedi mi?",
    ),
    Chat(
      name: "Kader B.",
      time: "Dün",
      imagePath: "images/1.png",
      isRead: true,
      message: "Yarın",
    ),
    Chat(
      name: "Esra S.",
      time: "2 gün önce",
      imagePath: "images/5.png",
      isRead: true,
      message: "Teyzeme selam söyle",
    ),
    Chat(
      name: "Ömer Faruk B.",
      time: "1 hafta önce",
      imagePath: "images/10.png",
      isRead: true,
      message: "Ödev dosyalarını attım",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          Chat chat = chats[index];
          return InkWell(
            onTap: () {},
            child: SizedBox(
              height: 80,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 12,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(chat.imagePath),
                      radius: 28,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              chat.name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text(
                              chat.time,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                              ),
                            ),
                            SizedBox(width: 12),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.done_all,
                              size: 16,
                              color: chat.isRead ? Colors.green : Colors.grey,
                            ),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                chat.message,
                                style: TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 12),
                          ],
                        ),
                        Spacer(),
                        Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
