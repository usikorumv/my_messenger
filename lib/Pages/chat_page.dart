import 'package:flutter/material.dart';
import 'package:messenger/Data/data.dart';
import 'package:messenger/Variables/variables.dart';

class ChatPage extends StatefulWidget {
  ChatPageState createState() => ChatPageState();
  final bool isOnline;
  final String name;
  final int indx;
  ChatPage({this.isOnline, this.name, this.indx});
}

class ChatPageState extends State<ChatPage> {
  Widget build(BuildContext context) {
    List chatMessages = chatsData[widget.indx].chatMessages;
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ListView.builder(
                // Создаем сообщения
                itemCount: chatMessages.length,
                itemBuilder: (context, index) =>
                    Message(messages: chatMessages[index]),
              ),
            ),
          ),
          ChatsInputField(),
        ],
      ),
    );
  }

  Widget appBar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: darkColor,
      leading: BackButton(),
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {}, // Кнопка "еще"
        )
      ],
      title: Row(
        children: [
          InkWell(
            onTap: () {}, // Кнопка открывающая информацию об контакте
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Row(
                children: [
                  CircleAvatar(
                    //backgroundImage: AssetImage(), //Изображение на аватарке
                    backgroundColor: nightGreyColor,
                  ),
                  SizedBox(width: deffaultPadding / 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name, //Имя
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        widget.isOnline
                            ? 'online'
                            : 'was recently', // Текущяя активность
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
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

class Message extends StatelessWidget {
  final messages;
  Message({@required this.messages});

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment:
          messages.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.65),
          child: Card(
            color: nightGreyColor.withOpacity(messages.isMe ? 1 : 0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: deffaultPadding / 2,
                    left: deffaultPadding / 2,
                    right: messages.isMe ? size.width / 6 : size.width / 8.75,
                    bottom: deffaultPadding / 1.8,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 3),
                    child: Text(
                      messages.text, // Текст сообщения
                      style: TextStyle(
                        color: messages.isMe ? Colors.white : nightGreyColor,
                        fontWeight:
                            messages.isMe ? FontWeight.w400 : FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 6,
                  child: Row(
                    children: [
                      Text(
                        messages.time, // Время отправки сообщения
                        style: TextStyle(
                          fontSize: 12,
                          color: messages.isMe
                              ? Colors.white.withOpacity(0.3)
                              : Colors.white.withOpacity(0.75),
                          fontWeight:
                              messages.isMe ? FontWeight.w400 : FontWeight.w800,
                        ),
                      ),
                      SizedBox(width: 4),
                      messages.isMe
                          ? Icon(
                              messages.messageStatus == MessageStatus.viewed
                                  ? Icons.done_all
                                  : messages.messageStatus ==
                                          MessageStatus.not_view
                                      ? Icons.done
                                      : Icons.access_time, // Статус сообщения
                              color: Colors.white.withOpacity(0.3),
                              size: 20,
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChatsInputField extends StatelessWidget {
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();
    bool show = false;

    return Container(
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: nightGreyColor,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 2),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Expanded(
                        child: TextFormField(
                          controller:
                              myController, // При помощи этого контроллера можно получить введенный текст .myController.text
                          onChanged: (text) =>
                              text.isNotEmpty ? show = true : show = false,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Type message',
                            hintStyle: TextStyle(
                              color: lightGreyColor,
                              fontSize: 18,
                            ),
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                              onPressed: () {}, // Кнопка эмодзи
                              icon: Icon(
                                Icons.emoji_emotions,
                                color: lightGreyColor,
                                size: 32,
                              ),
                            ),
                            suffixIcon: show == false
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {}, // Прикрепить файл
                                        icon: Icon(Icons.attach_file),
                                        color: lightGreyColor,
                                      ),
                                      IconButton(
                                        onPressed: () {}, // Микрофон
                                        icon: Icon(Icons.mic_outlined),
                                        color: lightGreyColor,
                                      ),
                                    ],
                                  )
                                : IconButton(
                                    onPressed: () {}, // Отправить
                                    icon: Icon(Icons.send),
                                    color: Colors.white,
                                  ),
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
