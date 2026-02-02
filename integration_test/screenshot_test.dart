import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// Importa o arquivo principal do SEU app
import 'package:appmarket/main.dart' as app;

void main() {
  // Inicializa o binding necessário para testes de integração
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Navegar e tirar screenshots das 4 abas',
      (WidgetTester tester) async {
    // Inicia o app como se fosse o usuário abrindo
    app.main();
    // Espera todas as animações iniciais terminarem e o app "assentar"
    await tester.pumpAndSettle();

    // ---------------------------------------------------------
    // TELA 1: LOJAS (É a inicial)
    // ---------------------------------------------------------
    // COMANDO ESPECIAL PARA ANDROID:
    // Converte a tela do Flutter (que é um Canvas) para imagem
    // Sem isso, o print pode sair preto ou bugado no Android
    await binding.convertFlutterSurfaceToImage();
    await tester.pumpAndSettle();
    await binding.takeScreenshot('01_lojas');
    print("📸 Print 1: Lojas capturado");

    // ---------------------------------------------------------
    // TELA 2: PRODUTOS
    // ---------------------------------------------------------
    // Encontra o botão pelo ícone (Shopping Basket)
    final botaoProdutos = find.byIcon(Icons.shopping_basket);

    // O Robô clica no botão
    await tester.tap(botaoProdutos);

    // IMPORTANTE: Espera a animação da troca de tela terminar
    await tester.pumpAndSettle();

    // Avança o tempo em 500ms para o "efeito de clique" sumir totalmente
    await tester.pump(const Duration(milliseconds: 500));

    await binding.takeScreenshot('02_produtos');
    print("📸 Print 2: Produtos capturado");

    // ---------------------------------------------------------
    // TELA 3: SALDO
    // ---------------------------------------------------------
    // Também podemos encontrar pelo Texto:
    final botaoSaldo = find.text('Saldo');
    await tester.tap(botaoSaldo);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 500));
    await binding.takeScreenshot('03_saldo');
    print("📸 Print 3: Saldo capturado");

    // ---------------------------------------------------------
    // TELA 4: HISTÓRICO
    // ---------------------------------------------------------
    final botaoHistorico = find.byIcon(Icons.history);
    await tester.tap(botaoHistorico);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(milliseconds: 500));
    await binding.takeScreenshot('04_historico');
    print("📸 Print 4: Histórico capturado");
  });
}

// Exemplo: Clicar em um botão
// final botao = find.byKey(Key('meu_botao'));
// await tester.tap(botao);
// await tester.pumpAndSettle(); // Espera a animação do clique

// await binding.takeScreenshot('02_segunda_tela');
