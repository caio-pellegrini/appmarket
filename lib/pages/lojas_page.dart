import 'package:flutter/material.dart';
import 'package:appmarket/mock/lojas_mock.dart';

class LojasPage extends StatelessWidget {
  LojasPage({super.key});

  final lojas = mockLojas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lojas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Selecione a loja que deseja acesar:'),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: lojas.length,
                itemBuilder: (context, index) {
                  final loja = lojas[index];
                  return Card(
                    color: Colors.grey[200],
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const Icon(Icons.storefront),
                        title: Text(
                          loja.nome,
                          style: TextStyle(fontSize: 16),
                        ),
                        onTap: () {},
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
