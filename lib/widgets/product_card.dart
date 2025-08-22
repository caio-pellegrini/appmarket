import 'package:flutter/material.dart';
import 'package:appmarket/models/produto_model.dart';

class ProdutoCard extends StatefulWidget {
  final Produto produto;

  const ProdutoCard({
    super.key,
    required this.produto
  });

  @override
  State<ProdutoCard> createState() => _ProdutoCardState();
}

class _ProdutoCardState extends State<ProdutoCard> {
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
                    widget.produto.nome,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.produto.barcode,
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
                    widget.produto.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.produto.isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.produto.isFavorite = !widget.produto.isFavorite;
                    });
                  },
                ),
          ],
        ),
      )
    );
  }

  Widget _buildImagePlaceholder() {
    bool hasImage = widget.produto.imageUrl != null && widget.produto.imageUrl!.isNotEmpty;

    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: hasImage
      ? ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          widget.produto.imageUrl!,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          },
          errorBuilder: (context, error, StackTrace) {
            return const Icon(
              Icons.no_photography_outlined,
              color: Colors.black,  
            );
          },
        )
      )
      : const Icon(
        Icons.no_photography_outlined,
        color: Colors.black,
      )
    );
  }
}

