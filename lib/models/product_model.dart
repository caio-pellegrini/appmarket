class Produto {
  // integrar com API ou mock
  final String nome;
  final String barcode;
  final String? imageUrl;
  bool isFavorite;

  Produto({
    required this.nome,
    required this.barcode,
    this.imageUrl,
    this.isFavorite = false,
    });
}