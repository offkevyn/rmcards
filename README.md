# Rick and Morty Cards

Projeto desenvolvido com o objetivo de praticar o consumo de APIs, gerenciamento de estado e integração com Firebase no Flutter.

## Visão Geral

O aplicativo **Rick and Morty Cards** é uma aplicação mobile que consome a API pública do universo Rick and Morty. Ele apresenta os personagens em forma de **cards interativos**, permitindo que você pesquise, favorite e explore os personagens de forma divertida e organizada.

## Funcionalidades

- **Listagem de Personagens (scroll infinito):** Acesse rapidamente todos os personagens do desenho animado Rick and Morty com informações detalhadas.
- **Pesquisa Dinâmica:** Pesquise qualquer personagem pelo nome de forma rápida e eficiente.
- **Favoritos:** Salve seus personagens favoritos e acesse-os facilmente a qualquer momento.
- **Cards Aleatórios Diários:** Todos os dias uma nova seleção aleatória de cards é apresentada automaticamente.
- **Autenticação com Firebase:** Cadastro, login e recuperação de senha integrados ao Firebase.

## Tecnologias Principais

- **Flutter Modular** (Estrutura prática para o projeto, injeção de dependências, e gerenciamento de rotas)
- **Bloc** (gerenciamento de estado leve e eficaz)
- **DIO** (requisições à API)
- **Lottie** (utilizado para pegar gifs)
- **Firebase Authentication** (para login, cadastro e recuperação de senha)
- **Firebase Firestore** (armazenamento dos cards favoritos)

## Prototipação

Você pode visualizar a prototipação no Figma [aqui](https://www.figma.com/design/ce6sHY46PvYam8bpUoOy8x/RMCards?node-id=14-59&t=PBqL3W9PwbXpIGxA-0).

## Links

- API Utilizada: [link da API](https://rickandmortyapi.com/)
- Play Store: ~~[Em breve]~~
- App Store: ~~[Em breve]~~
  
## Como Usar

### Pré-requisitos

- Flutter 3.29.0
- Dart 3.7.0

### Instalação

1. Clone o repositório:

    ```bash
    git clone https://github.com/offkevyn/rmcards
    ```

2. Navegue até o diretório do projeto:

    ```bash
    cd seu-repositorio
    ```

3. Execute os comandos:

    ```bash
    flutter pub get
    flutter run
    ```

Agora você pode abrir o aplicativo no seu dispositivo ou emulador.

## Licença

@offkevyn
