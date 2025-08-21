import 'package:flutter/material.dart';
import 'package:appmarket/models/product_model.dart';
import 'package:appmarket/widgets/product_card.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  bool _mostrarApenasFavoritos = false;

  final List<Produto> _todosOsProdutos = [
    Produto(
      nome: 'Arroz Branco 5kg Tio João',
      barcode: '7893500020165',
      isFavorite: false,
      imageUrl: 'http://www.eanpictures.com.br:9000/api/gtin/7893500020165',
    ),
    Produto(
      nome: 'Coca-Cola Lata 350ml',
      barcode: '7894900010015',
      isFavorite: true,
      imageUrl: 'http://cdn-cosmos.bluesoft.com.br/products/7894900010015',
    ),
    Produto(
      nome: 'Sabonete Dove 90g',
      barcode: '7891150064980',
      isFavorite: false,
      imageUrl: 'http://www.eanpictures.com.br:9000/api/gtin/7891150064980',
    ),
    Produto(
      nome: 'Detergente Ypê Neutro 500ml',
      barcode: '7896098901425',
      isFavorite: false,
      imageUrl: 'http://cdn-cosmos.bluesoft.com.br/products/7896098900208',
    ),
    Produto(
      nome: 'Leite Italac Integral 1L',
      barcode: '7896036097066',
      isFavorite: false,
      imageUrl: 'http://www.eanpictures.com.br:9000/api/gtin/7896036097066',
    ),
    Produto(
      nome: 'Pão de Forma Pullman Tradicional 500g',
      barcode: '7896004000029',
      isFavorite: false,
      imageUrl: 'http://www.eanpictures.com.br:9000/api/gtin/7896004000029',
    ),
    Produto(
      nome: 'Banana Prata - kg',
      barcode: '7890000000013',
      isFavorite: false,
      imageUrl: 'http://www.eanpictures.com.br:9000/api/gtin/7890000000013',
    ),
    Produto(
      nome: 'Peito de Frango Congelado Seara 1kg',
      barcode: '7898495380003',
      isFavorite: false,
      imageUrl: 'http://www.eanpictures.com.br:9000/api/gtin/7898495380003',
    ),
    Produto(
      nome: 'Lasanha Bolonhesa Sadia 600g',
      barcode: '7893000511515',
      isFavorite: false,
      imageUrl: 'http://www.eanpictures.com.br:9000/api/gtin/7893000511515',
    ),
    Produto(
      nome: 'Ração Pedigree Cães Adultos 1kg',
      barcode: '7896029070245',
      isFavorite: false,
      imageUrl: 'http://www.eanpictures.com.br:9000/api/gtin/7896029070245',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Produto> produtosParaExibir = _mostrarApenasFavoritos
        ? _todosOsProdutos.where((produto) => produto.isFavorite).toList()
        : _todosOsProdutos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, color: Colors.black),
        ), // colorir icone
        title: const Text('ManiaX', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle_outlined, color: Colors.black),
          ),
        ],
      ),
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
