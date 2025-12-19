import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// Importa o arquivo principal do SEU app
import 'package:appmarket/main.dart' as app;

void main() {
  // Inicializa o binding necessário para testes de integração
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Capturar screenshots da tela inicial',
      (WidgetTester tester) async {
    // Inicia o app como se fosse o usuário abrindo
    app.main();

    // Espera todas as animações iniciais terminarem e o app "assentar"
    await tester.pumpAndSettle();

    // COMANDO ESPECIAL PARA ANDROID:
    // Converte a tela do Flutter (que é um Canvas) para imagem
    // Sem isso, o print pode sair preto ou bugado no Android
    await binding.convertFlutterSurfaceToImage();

    // Espera mais um pouco para garantir a renderização
    await tester.pumpAndSettle();

    // Tira o print!
    // O nome '01_home_screen' será o nome do arquivo salvo
    await binding.takeScreenshot('01_home_screen');

    print("Screenshot capturada com sucesso!");
  });
}

// Exemplo: Clicar em um botão
// final botao = find.byKey(Key('meu_botao'));
// await tester.tap(botao);
// await tester.pumpAndSettle(); // Espera a animação do clique

// await binding.takeScreenshot('02_segunda_tela');
