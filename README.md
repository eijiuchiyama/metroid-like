# Metroid-Like Game
Este projeto é iniciado como o trabalho solicitado pelo curso [MAC0413/5714 - Tópicos Avançados de Programação Orientada a Objetos (2024)](https://edisciplinas.usp.br/course/view.php?id=121856) oferecido pelo IME-USP no segundo semestre do ano de 2024. Neste projeto implementaremos uma versão contemporânea do jogo clássico [Metroid](https://en.wikipedia.org/wiki/Metroid) utilizando a engine livre [Godot](https://godotengine.org/), oferecendo um novo projeto gráfico e uma estória alternativa.

![Logo](estrutura/Logo.png)

## Descrição do jogo
Durante o projeto, implementaremos os mecanismos mais característicos do jogo clássico Metroid a seguir:

![Features](estrutura/Features.png)

Com base nisto, construímos o seguinte diagrama de classes para ajudar o processo de desenvolvimento:

![Class](estrutura/Class.jpg)

**OBS: Durante o processo de desenvolvimento do jogo, muitas mudanças foram realizadas em relação às classes e o diagrama abaixo está desatualizado.
Na seção de relatório, para cada padrão implementado, haverá uma seção explicando a implementação definitiva dele, e, para a entrega final, haverá 
um novo diagrama de classes atualizado para a versão final do projeto.**

As imagens apresentadas no README estão armazenadas na pasta 'Estrutura do Jogo'

## Instruções de Instalação
Para executar o jogo, basta instalar os arquivos contidos na pasta Game/ e executar o arquivo correspondente ao sistema operacional.

Controles:
- W, A, S, D: Movimento da Personagem, Direção da Arma
- W, S: Transformação entre estado Humano e Bola
- Space: Pular
- Shift: Atirar
- Ctrl: Trocar a Arma

## Cronograma do projeto
A entrega é dividida em múltiplas etapas:

### Fase 1
Desenvolvemos os movimentos básicos do jogador, tais como andar, atirar, saltar, alternar entre as formas humana e bola. Como criamos o jogo através da engine Godot, a parte gráfica já começou a ser desenvolvida, e temos um protótipo minimamente funcional.

### Fase 2
Nesta fase, apresentaremos os padrões de projeto GoF utilizados até agora e explicaremos a vantagem oferecida pelo padrão. E nesta fase também implementaremos a interação do jogador com inimigos, tais como barra de vida, hitbox do inimigo e do jogador, mudança de arma, dentre outras features. Também adicionaremos a história ao jogo (cutscene inicial e demais apresentações da história) e criaremos a estrutura do mundo e os itens coletáveis. 

### Fase 3
Esta é a entrega final do jogo completamente funcional.
Até aqui, o código deverá utilizar ao menos 4 padrões de projeto distintos. Nesta fase, deverá ser implementada a tela inicial e serem criados testes automatizados para as classes. Adicionaremos músicas e efeitos sonoros nesta última fase também. A maior parte do mapa deverá estar pronta na fase 2, mas ele estará pronto ao final da fase 3. Também o chefe final do jogo (boss) será criado nesta fase.

Dividimos as ações a serem realizadas com base nas fases, e atribuímos cada feature a ser criada a uma delas, como visto na parte de issues do projeto.

## Relatório do projeto

### Fase 1

Na fase 1, implementamos o padrão de estado (state) no nosso projeto. Também conseguimos criar assets para o player e para o mundo, porém alguns ainda não foram adicionados ao jogo. Conseguimos fazer o movimento básico, alternando as formas de movimentação do personagem, com o uso do padrão estado.

#### Padrão de estados (State pattern)

O padrão de estados foi utilizado para a implementação do movimento do jogador. O jogador possui uma relação de dependência com a classe State que, por sua vez realiza uma relação de associação com a StateManager. 

##### StateManager

A classe StateManager é bem simples e define a função switch_state. Tal método é responsável por definir o current_state. Nas funções built-in _ready e _process do Godot, a classe StateManager, respectivamente, inicializa e atualiza o current_state. 

##### State 

A classe State possui acesso ao seu respectivo StateManager, ao corpo do jogador, ao gerenciador de animações do jogador e ao braço do jogador. Define os métodos update_state e init_state. 

Essa classe, por sua vez, é especializada em subclasses IdleState, WalkState, JumpState que representam, respectivamente, os estados de jogador parado, andando e pulando.

No momento atual, esses estados simplesmente gerenciam animações de jogador conforme o estado, mas a lógica de movimentação permanece concentrada no código do jogador, pois parte da lógica de cada estado é utilizada por outros estados. Por exemplo, enquanto pula, um jogador pode se deslocar horizontalmente e utilizar a lógica do estado Andando. 

Entretanto, a adoção de tal padrão ainda é interessante para o projeto visando uma manutenção a longo prazo, pois os estados podem gerenciar outros aspectos além da animação do jogador. É comum em jogos, por exemplo, que alguns atributos do jogador sejam diferentes entre estados. Em um balanceamento do jogo, pode se tornar desejável que o deslocamento horizontal do jogador tenha velocidade diferente quando ele está simplesmente andando ou quando ele está no ar (no meio de um pulo ou queda). O valor momentâneo de um atributo é algo que pode ser gerenciado pelo estado. 

Em resumo, conforme a complexidade de um jogo aumenta, os estados tendem a possuirem maiores especificidades e propriedades únicas. No estado atual do projeto, a adoção do padrão auxilia no gerenciamento de animações e facilita a adição de futuras funcionalidades. Outra observação é que a habilidade de atirar está sendo implementada por outro membro do grupo e com base no padrão Estratégia, mas, em um momento no futuro, espera-se incorporar a lógica de tiro em um novo estado.

![State](estrutura/State_Pattern_UML.png)

Observação: Esse diagrama representa como o padrão foi implementado via script. Em Godot, existe a separação entre cenas/nós e scripts (código atribuído ao nó). Na cena do jogador, o nó do jogador "contém" o nó do StateManager (ou seja é nó pai do nó StateManger), mas, por código, não há interação direta entre essas classes. 

### Fase 2

Na fase 2, utilizamos o padrão estratégia (strategy) para facilitar a troca de armas. A máquina de estados, nesta fase, está mais completa que a anterior, tendo implementado a alternância entre as formas humana e bola. Começamos a criar os inimigos do jogo nesta fase, mas ainda não os havíamos adicionado nele.

#### Padrão de Fábrica (Factory pattern)
Como os diferentes armas possuem os mesmos métodos que podem ser acessadas pelas outras classes, foi aplicado o padrão de fábbrica junto com de estratégia a fim de evitar o uso dos desvios condicionais para identificação do tipo de arma, com isso foi possível diminuir a repetição de código e consequentemente facilitar a sua leitura e entendimento.

![Factory](estrutura/Factory_Pattern_UML.png)

#### Atualizações no padrão de Estados (State Pattern)

Durante a fase 1, o padrão de estados foi implementado, como descrito acima. Entretanto, mudanças foram adotadas durante a parte 2 para adicionar incrementar o jogo.

O projeto é inspirado na série de jogos Metroid, em que a personagem principal possui, como uma de suas habilidades mais icônicas, a capacidade de 
alternar de formas: forma antropomórfica e forma de "bola". A primeira é a forma padrão e "humana", em que a personagem pode ficar parada, atirar, pular e andar. Na segunda forma, a personagem fica menor e pode acessar áreas estreitas, mas também pode ficar parada e andar. Com pequnas variações, pode também pular após o desbloqueio da habilidade de pulo para essa forma e lançar bombas (do ponto de vista de impementação, é um "tiro" que adota outra estratégia do padrão Estratégia).

Repare que ambas as formas compartilham uma máquina de estados quase idêntica. Criar estados "bolaIdle", "bolaWalk", "bolaJump" seria extremamente redundante. A solução para incorporar essa mecânica de jogo com o padrão de estados foi a adoção de máquinas de estados concorrentes. Existem dois StateManager agora. O primeiro StateManger é o descrito na fase 1. O segundo StateManager é um gerenciador de estados que gerencia dois estados: os novos estados humana e bola. Esses estados, quando aplicados (ou seja, durante a execução do método init_state), definem os novos sprites de idle, walking, jumping do gerenciador de animações do personagem, a nova hitbox e (ainda não implementado, mas planejado para a entrega), a nova estratégia de tiro, de acordo com o novo estado.

### Fase 3

Nesta fase, o jogo está quase concluído, com a maioria das funcionalidades planejadas já implementadas. Entre elas, destacam-se a interação do jogador com inimigos e o ambiente, power-ups que desbloqueiam habilidades no jogo, a inclusão do mapa onde a ação se desenvolve, entre outros recursos. Além disso, foram introduzidos dois novos padrões no jogo, que são:

#### Padrão de Singleton

Sendo uma das funcionalidades oferecidas pela engine Godot, não foi necessário implementar nosso próprio código para utilizar este padrão. Para isso, basta adicionar a classe que desejamos usar como Singleton na seção correspondente da engine. Assim, ela pode ser acessada de forma única em todo o jogo:

![Singleton](estrutura/Singleton_Pattern.png)

#### Padrão de Estratégia (Strategy Pattern)

Os inimigos do jogo podem apresentar diversos tipos de movimento e ataque contra o jogador, sendo muitas vezes idênticos entre si em certos aspectos. Para evitar a repetição de código, utilizamos o padrão de estratégia, permitindo selecionar os componentes que definem o comportamento de um tipo específico de inimigo, como ilustrado no diagrama abaixo:

![Strategy](estrutura/Strategy_Pattern_UML.png)

#### Diagrama final

Após as fases de desenvolvimento, o diagrama do nosso jogo tornou-se mais completo e detalhado em comparação com o protótipo criado no início do projeto. Ele está estruturado da seguinte forma:

![Game](estrutura/Game_UML.png)

## Integrantes do grupo e seus NUSP
Atenágoras Silva - 5447262

Fernando Yang - 13671744

Lucas Eiji Uchiyama - 11807470

Marcelo Mendes Spessoto Junior - 12542380

## Orientadores do projeto/Project 
Fabio Kon: Professor

Isaque Alves: Monitor

## Créditos/Credits
SpaceStationAda - Jestan
sci-fi blade runner/terminator-like ominous dytopian tense dark thriller horror sfx  - Simonus18
