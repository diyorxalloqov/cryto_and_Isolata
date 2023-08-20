import 'package:cryto_and_isolate/domain/service/local/crypto_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController encryptController = TextEditingController();

  TextEditingController decryptController = TextEditingController();

  TextEditingController encryptRController = TextEditingController();

  TextEditingController decryptRController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: encryptController,
                  decoration: const InputDecoration(
                      hintText: "Encrypt data", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: encryptRController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    encryptRController.text =
                        CryptoService.encrypt(encryptController.text);
                  },
                  child: const Text("Encrypt"))
            ],
          )),
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: decryptController,
                  decoration: const InputDecoration(
                      hintText: "decrypt data", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: decryptRController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      decryptRController.text =
                          CryptoService.decrypt(decryptController.text);
                    });
                  },
                  child: const Text("Decrypt"))
            ],
          ))
        ],
      ),
    );
  }
}
