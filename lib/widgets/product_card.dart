import 'package:flutter/material.dart';
import 'package:appmarket/models/product_model.dart';

class ProdutoCard extends StatelessWidget {
  final Produto produto;

  const ProdutoCard({
    super.key,
    required this.produto
  });

  @override
  Widget build(BuildContext build) {
    return Card(
      color: Colors.grey[200],
      elevation: 0, // remove sombra
      margin: const EdgeInsets.only(bottom: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            _buildImagePlaceholder(),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produto.nome,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    produto.barcode,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    )
                  ),
                ],
              ),
            ),
            IconButton(
                  icon: Icon(
                    produto.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: produto.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    //setState(() {
                    //  produto.isFavorite = !produto.isFavorite;
                    //});
                  },
                ),
          ],
        ),
      )
    );
  }

  Widget _buildImagePlaceholder() {
    const double imageSize = 50.0;
    bool hasImage = produto.imageUrl != null && produto.imageUrl!.isNotEmpty;

    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: hasImage
      ? ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          produto.imageUrl!,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          },
          errorBuilder: (context, error, StackTrace) {
            return const Icon(
              Icons.no_photography_outlined,
              color: Colors.white,  
            );
          },
        )
      )
      : const Icon(
        Icons.no_photography_outlined,
        color: Colors.white,
      )
    );
  }
}

