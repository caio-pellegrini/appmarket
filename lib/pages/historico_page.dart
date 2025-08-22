import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:appmarket/models/compra_model.dart';

class HistoricoPage extends StatelessWidget {
  HistoricoPage({super.key});

  // Lista de dados de exemplo para o histórico
  final List<Compra> _historicoDeCompras = [
    Compra(quantidadeItens: 3, preco: 15.99, data: DateTime.parse('2025-08-17 05:15:00'), nomeLoja: 'Loja 1'),
    Compra(quantidadeItens: 5, preco: 45.50, data: DateTime.parse('2025-08-16 14:30:00'), nomeLoja: 'Loja 2'),
    Compra(quantidadeItens: 1, preco: 7.25, data: DateTime.parse('2025-08-16 09:05:00'), nomeLoja: 'Loja 1'),
    Compra(quantidadeItens: 8, preco: 89.90, data: DateTime.parse('2025-08-15 19:45:00'), nomeLoja: 'Loja 3'),
    Compra(quantidadeItens: 2, preco: 12.00, data: DateTime.parse('2025-08-14 11:20:00'), nomeLoja: 'Loja 1'),
    Compra(quantidadeItens: 4, preco: 22.75, data: DateTime.parse('2025-08-13 20:10:00'), nomeLoja: 'Loja 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Histórico',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Veja seu histórico de compras conosco:'),
            const SizedBox(height: 24),

            // A lista de histórico ocupa o resto da tela
            Expanded(
              child: ListView.builder(
                itemCount: _historicoDeCompras.length,
                itemBuilder: (context, index) {
                  final compra = _historicoDeCompras[index];
                  // Chamamos nosso widget customizado para cada item
                  return _buildHistoricoCard(compra);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para construir cada card do histórico
  Widget _buildHistoricoCard(Compra compra) {
    // Formatador para a data e hora
    final DateFormat formatadorData = DateFormat('dd/MM/yyyy \'às\' HH:mm');

    return Card(
      elevation: 0,
      color: Colors.grey[200],
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Lado Esquerdo: Quantidade e Preço
            Row(
              children: [
                // Ícone de carrinho e quantidade de itens
                Column(
                  children: [
                    Text(
                      compra.quantidadeItens.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const Icon(Icons.shopping_cart, color: Colors.black54),
                  ],
                ),
                const SizedBox(width: 16),
                // Preço
                Text(
                  'R\$ ${compra.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),

            // Lado Direito: Data, Loja e Seta
            Row(
              children: [
                // Coluna com Data e Loja
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatadorData.format(compra.data),
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      compra.nomeLoja,
                      style: const TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                // Ícone de seta para baixo
                const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
              ],
            ),
          ],
        ),
      ),
    );
  }
}