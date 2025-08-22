import 'package:flutter/material.dart';
import 'package:appmarket/models/produto_model.dart';
import 'package:appmarket/widgets/product_card.dart';
import 'package:appmarket/mock/produtos_mock.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  bool _mostrarApenasFavoritos = false;

  final _todosOsProdutos = mockProdutos;

  @override
  Widget build(BuildContext context) {
    final List<Produto> produtosParaExibir = _mostrarApenasFavoritos
        ? _todosOsProdutos.where((produto) => produto.isFavorite).toList()
        : _todosOsProdutos;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Produtos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Mostrar apenas favoritos'),
              value: _mostrarApenasFavoritos,
              onChanged: (novoValor) {
                setState(() {
                  _mostrarApenasFavoritos = novoValor!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: produtosParaExibir.length,
                itemBuilder: (context, index) {
                  final produto = produtosParaExibir[index];

                  return ProdutoCard(produto: produto);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
