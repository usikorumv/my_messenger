User me = new User(
  name: 'Us O',
  account: 'uomuraliev09@gmail.com',
  image: ' ',
  isActive: true,
);

class User {
  final String name, account, image;
  final bool isActive;
  User({this.name, this.account, this.image, this.isActive});
}

enum ChatMessageType { text, audio, image, video }
enum MessageStatus { not_sent, not_view, viewed }

class ChatMessage {
  final String text, time;
  final ChatMessageType messageType;
  final MessageStatus messageStatus;
  final bool isMe;
  ChatMessage(
      {this.text, this.time, this.messageType, this.messageStatus, this.isMe});
}

List contactsData = [
  User(
    name: 'Adil Akakov',
    account: 'adil.akakov@alatoo.edu.kg',
    image: ' ',
    isActive: false,
  ),
  User(
    name: 'Nur Ab',
    account: 'nur.ab@iaau.edu.kg',
    image: ' ',
    isActive: false,
  ),
  User(
    name: 'Ahmet M',
    account: 'progamer777@gmail.com',
    image: ' ',
    isActive: false,
  ),
  User(
    name: 'Shermat',
    account: 'esherov@mail.ru',
    image: ' ',
    isActive: false,
  ),
];

class Chat {
  final String name, image;
  final bool isActive;
  final List chatMessages;
  Chat({this.name, this.image, this.isActive, this.chatMessages});
}

List chatsData = [
  Chat(
    name: 'Adil Akakov',
    isActive: false,
    chatMessages: [
      ChatMessage(
          text: 'Hi',
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.viewed,
          isMe: true,
          time: '12:00'),
      ChatMessage(
          text: 'How are you?',
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.viewed,
          isMe: true,
          time: '12:00'),
      ChatMessage(
          text: 'Fine, how about you?',
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.viewed,
          isMe: false,
          time: '12:02'),
      ChatMessage(
          text: 'I`m fine too',
          messageType: ChatMessageType.text,
          messageStatus: MessageStatus.not_sent,
          isMe: true,
          time: '12:05'),
    ],
  ),
  Chat(
    name: 'Nur Ab',
    isActive: false,
    chatMessages: [
      ChatMessage(
        text: 'Are you finished finished?',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isMe: false,
        time: '18:30',
      ),
    ],
  ),
  Chat(
    name: 'Ahmet M',
    isActive: false,
    chatMessages: [
      ChatMessage(
        text:
            'The very long message for testing maxlies and other variables for this widget which contains innteresting features',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isMe: false,
        time: '03:20',
      ),
      ChatMessage(
        text:
            'Another long message for make sure it`s works, Lol AHAHHAAHHAAHAHH AAAAHAHAHHAAAHHA. It`s works',
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.viewed,
        isMe: true,
        time: '03:25',
      ),
    ],
  ),
];
