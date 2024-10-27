# Metroid-Like Game
Este projeto é iniciado como o trabalho solicitado pelo curso [MAC0413/5714 - Tópicos Avançados de Programação Orientada a Objetos (2024)](https://edisciplinas.usp.br/course/view.php?id=121856) oferecido pelo IME-USP no segundo semestre do ano de 2024. Neste projeto implementaremos uma versão contemporânea do jogo clássico [Metroid](https://en.wikipedia.org/wiki/Metroid) utilizando a engine livre [Godot](https://godotengine.org/), oferecendo um novo projeto gráfico e uma estória alternativa.

## Descrição do jogo
Durante o projeto, implementaremos os mecanismos mais característicos do jogo clássico Metroid a seguir:

![Features](Estrutura do jogo/Features.png)

Com base nisto, construímos o diagrama de classes para ajudar o processo de desenvolvimento:

![Class](Estrutura do jogo/Class.jpg)

As imagens apresentadas no README estão armazenadas na pasta 'Estrutura do Jogo'

## Instruções de Instalação

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

Na fase 1, implementamos os padrões estado (state). Também conseguimos criar assets para o player e para o mundo, porém alguns ainda não foram adicionados ao jogo. Conseguimos fazer o movimento básico, alternando as formas de movimentação do personagem, com o uso do padrão estado.

### Fase 2

Na fase 2, utilizando o padrão estratégia (strategy), implementamos a troca de armas. A máquina de estados, nesta fase, está mais completa que a anterior, tendo implementado a alternância entre as formas humana e bola. Começamos a criar os inimigos do jogo nesta fase, mas ainda não os havíamos adicionado nele.

### Fase 3

## Integrantes do grupo e seus NUSP
Atenágoras Silva - 5447262

Fernando Yang - 13671744

Lucas Eiji Uchiyama - 11807470

Marcelo Mendes Spessoto Junior - 12542380

## Orientadores do projeto
Fabio Kon: Professor

Isaque Alves: Monitor
