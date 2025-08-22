# AppMarket

## Visão Geral

AppMarket é um protótipo de aplicativo de mini-mercado desenvolvido em Flutter. Este projeto educacional simula as funcionalidades essenciais de um aplicativo de varejo, permitindo aos usuários visualizar lojas e produtos, gerenciar saldo e acompanhar o histórico de compras.

## Estrutura do Projeto

O código-fonte está organizado da seguinte forma:

  * **`lib/`**: Código Dart da aplicação.
      * **`pages/`**: Telas do aplicativo (Lojas, Produtos, Saldo, Histórico).
      * **`models/`**: Classes de modelo de dados (Produto, Loja, Compra).
      * **`widgets/`**: Componentes de UI reutilizáveis.
      * **`mock/`**: Dados simulados para popular o aplicativo.
  * **`android/`**, **`ios/`**, etc.: Arquivos de configuração específicos de cada plataforma.
  * **`pubspec.yaml`**: Definição das dependências do projeto.

## Como Reproduzir o Projeto

### Pré-requisitos

  * [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado.
  * Um editor de código como VS Code ou Android Studio.

### Passos

1.  **Clonar o Repositório:**

    ```bash
    git clone https://github.com/caio-pellegrini/appmarket.git
    cd appmarket
    ```

2.  **Instalar Dependências:**

    ```bash
    flutter pub get
    ```

3.  **Executar o App:**

    ```bash
    flutter run
    ```
