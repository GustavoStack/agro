import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot Agronegócio',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<Map<String, dynamic>> messages = [];

  final TextEditingController controller = TextEditingController();

  void sendMessage() {
    if (controller.text.isNotEmpty) {
      setState(() {
        messages.add({"text": controller.text, "sender": "user"});
        // Adicione aqui a lógica para gerar uma resposta do chatbot
        messages.add({"text": "Resposta do chatbot", "sender": "bot"});
      });
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121), // Cor de fundo escura
      appBar: AppBar(
        backgroundColor: Color(0xff43b965), // Cor de fundo do AppBar
        title: const Text(
          'Agro-GPT',
          style: TextStyle(color: Colors.white), // Cor do texto do AppBar
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    messages[index]["text"],
                    style: TextStyle(
                        color: Colors.white), // Cor do texto das mensagens
                  ),
                  subtitle: Text(
                    messages[index]["sender"],
                    style: TextStyle(
                        color: Colors.white), // Cor do texto do remetente
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    cursorColor: Colors.white,
                    style: TextStyle(
                        color:
                            Colors.white), // Cor do texto do campo de entrada
                    decoration: InputDecoration(
                      fillColor: Color(0xff424242), // Atualize esta linha
                      filled: true,
                      labelText: 'Digite sua mensagem',
                      labelStyle: TextStyle(
                          color: Colors
                              .white), // Cor do rótulo do campo de entrada
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send,
                      color: Colors.white), // Cor do ícone de envio
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
