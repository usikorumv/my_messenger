import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messenger/Data/data.dart';
import 'package:messenger/Pages/chat_page.dart';
import 'package:messenger/Variables/variables.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: nightGreyColor,
        title: Text('USMessenger', style: GoogleFonts.rubik(fontSize: 16)),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}) // Поиск чатов
        ],
      ),
      drawer: MyDrawer(), // Выдвижной лист справа
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {}, // Кнопка чаты
          backgroundColor: nightGreyColor,
          child: Icon(Icons.chat, size: 30),
        ),
      ),
      body: myBody(),
    );
  }

  Widget myBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder( // Создаем чаты имея длинну сколько чатов у нас есть 
            itemCount: chatsData.length,
            itemBuilder: (context, index) =>
              Chats(
                chat: chatsData[index], 
                indx: index,
                onTap: () => Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => ChatPage(name: chatsData[index].name, indx: index, isOnline: chatsData[index].isActive),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Chats extends StatelessWidget {
  final Chat chat;
  final int indx;
  final VoidCallback onTap;

  Chats({this.chat, this.indx, this.onTap});

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var lastChatMessageStatus  = chat.chatMessages[chat.chatMessages.length - 1].messageStatus;

    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Divider( // Раздельная линия
              indent: size.width / 6.25,
              thickness: 1,
              color: indx != 0 ? lightGreyColor.withOpacity(0.4) : Colors.transparent, 
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  //backgroundImage: AssetImage(chat.image),
                  backgroundColor: nightGreyColor,
                ),
                Expanded(
                  child: SizedBox( // Это нужно чтобы размер чата не изменялся
                  height: 60,
                    child: Padding(
                      padding: EdgeInsets.only(left: 8, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chat.name, // Имя пользователя
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: deffaultPadding),
                              child: Text(
                                chat.chatMessages.last.text, // Последнее сообщениие от пользователя
                                style: GoogleFonts.rubik(
                                  color: lightGreyColor.withOpacity(0.9),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              maxLines: 2, // У Whatsapp это 1
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: deffaultPadding * 0.75),
                  child: Column(
                    children: [
                      Text(
                        chat.chatMessages.last.time, // Время последнего отправленного сообщения
                      ),
                      SizedBox(height: 6),
                      chat.chatMessages.last.isMe ? Icon(
                        lastChatMessageStatus == MessageStatus.viewed ? Icons.done_all : lastChatMessageStatus == MessageStatus.not_view ? Icons.done : Icons.access_time, // Статус сообщения
                        color: nightGreyColor,
                        size: 20,
                      ) : SizedBox(height: 4),
                    ]
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyDrawer extends StatefulWidget { // Наш выдвижной лист
  MyDrawerState createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: darkColor,
            ),
            accountName: Text(me.name), // Мое имя
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              //backgroundImage: myUserData['image'] // Изображение моего аккаунта
            ),
            accountEmail: Text(me.account), // Мой аккаунт
          ),  
          //Дальше идут кнопки нашего выдвижного листа
          DrawerComponent(
            onTap: () {},
            iconData: Icons.group,
            text: 'New Group',
          ),
          DrawerComponent(
            onTap: () {},
            iconData: Icons.contacts,
            text: 'Contacts',
          ),
          DrawerComponent(
            onTap: () {},
            iconData: Icons.bookmark_border,
            text: 'Saved Messages',
          ),
          DrawerComponent(
            onTap: () {},
            iconData: Icons.settings,
            text: 'Settings',
          ),
          Divider(
            thickness: 1,
          ),
          DrawerComponent(
            onTap: () {},
            iconData: Icons.help_outline,
            text: 'About USMessenger',
          ),
        ],
      ),
    );
  }
}

class DrawerComponent extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onTap;
  DrawerComponent({this.iconData, this.onTap, this.text});

  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: darkColor.withOpacity(0.7),
      ),
      title: Text(
        text,
        style: GoogleFonts.rubik(
          color: darkColor.withOpacity(0.7),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap,
    );
  }
}
