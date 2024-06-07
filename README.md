# Marvel App

Este é um aplicativo Flutter que exibe uma lista de personagens da Marvel, recuperados a partir da API oficial da Marvel.


## Índice
- [Detalhes](#detalhes)
- [Telas](#telas)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Como Executar](#como-executar)


## Detalhes

O projeto foi desenvolvido utilizando clean architecture e modularização, boas práticas como componentização de widgets e testes unitários. Além disso, foram realizados testes de responsividade em dispositivos Android e iOS.

## Telas

**Splash Page**

O acesso ao aplicativo começa com uma Splash Page temática. Essa escolha permite que as chamadas de inicialização sejam carregadas "escondidas" do usuário, proporcionando uma experiência mais polida ao uso do aplicativo.

Obs.: Imagens capturadas de um celular samsung.


![](/assets/prints/splash_page_s22_real.jpg)


**Home Page**

Na Home Page, há um carrossel automático que exibe 5 personagens selecionados com base em um ID de quadrinho e um deslocamento (offset), a fim de mostrar personagens mais conhecidos do público geral. Abaixo do carrossel, há um scroll infinito que exibe todos os personagens da Marvel. Cada cartão de personagem é clicável, levando o usuário à página de descrição do personagem selecionado.

A escolha do carrossel automático adiciona uma sensação de movimento ao aplicativo, e o controle manual permite que o usuário navegue rapidamente pelos personagens, se necessário. A seleção personalizada de personagens mais conhecidos visa chamar a atenção do usuário logo no início, antes de apresentar a lista completa de personagens.

Obs.: Imagens capturadas de um celular samsung.

![](/assets/prints/home_page_s22_real.jpg)

![](/assets/prints/home_page_s22_real_2.jpg)


**Description Page**

Ao clicar no cartão de um personagem, o usuário é direcionado à página de descrição, que exibe a imagem, o nome e a descrição do personagem selecionado.
Essa página fornece mais detalhes sobre o personagem, aprofundando a experiência do usuário.

Observação: Nem todos os personagens retornam uma descrição na API, então foi implementado um tratamento de erro para lidar com esse tipo de retorno.

Obs.: Imagens capturadas de um celular samsung.

![](/assets/prints/description_page_s22_real.jpg)

![](/assets/prints/description_page_s22_real_2.jpg)

**Error Page**

Quando se tem um retorno de erro da api, é retornado uma pagina de erro aonde é informado ao usuário sobre o problema tecnico e com um botão para saida do app, assim evitando o acesso a pagina da home sem as informações de retorno devido a algum problema na chamada ou na api em questão.

Obs.: Imagens capturadas de um celular samsung.

![](/assets/prints/error_page_s22_real.jpg)



## Tecnologias Utilizadas

- Modular: Injeção de dependência e navegação
- Mobx: Gerenciamento de estado
- Logger: Observabilidade
- Mocktail: Testes
- Cached Network: Cacheamento de dados (imagem)
- Dio: Consumo de API
- Dartz: Erros e exceções
- Carousel Slider: Para criação do widget do carrossel
- Dotenv: Variáveis de ambiente
- Device Preview: Para testes de tela responsiva


## Como Executar
Descreva os passos necessários para executar o projeto localmente:

1. Faça o download dos arquivos pelo gitHub.

2. Abra os arquivos no VsCode.

3. Abra o terminal e rode o seguinte comando:
   flutter pub get

4. Em seguida roda o seguinte comando:
   flutter pub run build_runner build

5. Na pasta .env se encontram strings vazias, preencha com os valores solicitados na variaveis para a autenticação da chamada da api.
   As autenticações são geradas pelo cadastro na api da marvel, faça o cadastro nesse site https://developer.marvel.com/ e clique em Get a key.
   O valor da API_KEY é o valor da public key e o valor da API_HASH é a criação de um hash que pode ser gerado nesse site https://www.md5hashgenerator.com/, digite: 1+ o valor da sua private key + o valor da sua public key.

6. Acesse o arquivo main na lib e clique no run acima da função void main().

