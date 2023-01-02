# Programação Funcional e em Lógica: Segundo projeto

## Estrutura do ficheiro README:

### Identificação do trabalho (jogo) e do grupo (designação do grupo, número e nome completo de cada um dos elementos), assim como indicação da contribuição (em percentagem, somando 100%) de cada elemento do grupo para o trabalho:

- **Identificação do trabalho (jogo):** Taacoca.
- **Designação do grupo:** G12_03 (Taacoca_3).
- **Turma prática:** T12 (3LEIC12).
- **Elemento do grupo e respetivo número de estudante:** Pedro Jorge da Rocha Balazeiro (up202005097).
- **Contribuição do elemento acima:** 50 %.
- **Elemento do grupo e respetivo número de estudante:** Rúben Costa Viana (up202005108).
- **Contribuição do elemento acima:** 50 %.
- **Soma da contribuição dos dois elementos:** 100%.

###  Instalação e Execução: incluir todos os passos necessários para correta execução do jogo em ambientes Linux e Windows (para além da instalação do SICStus Prolog 4.7.1):

A instalação do SICStus Prolog 4.7.1 estava devidamente identificada e explicada no site da cadeira de PFL, na secção "Outros recursos".

- **Windows:** Para a correta execução do jogo basta abrir o terminal do diretório do projeto e inserir o seguinte comando : `start "C:\caminho\para\sicstus.exe"`.

* #### **Demonstração para windows abaixo:**
![Windows Start](/windows.png)

- **Linux:**

Para carregar o jogo basta inserir e executar o seguinte comando como feito abaixo: `[taacoca].` 

* #### **Como carregar Taacoca:**
![Carregar o jogo](/taacoca.png)

###  Descrição do jogo (descrição sumária do jogo e suas regras até 350 palavras). Devem incluir ainda ligações usadas na recolha de informação (página oficial do jogo, livro de regras, etc.):

- **Descrição sumária do jogo:** Taacoca é um jogo de tabuleiro abstrato para dois jogadores, que foi inventado por Víkingur Fjalar Eiríksson em 2009. O tabuleiro é hexagonal e tem cinco células de cada lado. A linha inferior é a "casa" para o jogador branco e a linha superior é a "casa" para o jogador preto. Inicialmente cada jogador começa com 12 pedras da sua cor. A posição inicial das pedras é mostrada na figura abaixo:

* #### **Tabuleiro e pedras na sua posição inicial:**
![Tabuleiro](/board.png)

- **Regras:** O objetivo deste jogo é chegar à "casa" adversária com uma das pedras do jogador. Também é possível ganhar se o adversário ficar sem pedras ou movimentos. Não existem empates. Começando pelas pedras brancas, os jogadores jogam por turnos movendo quaisquer três pedras suas uma célula para frente (se um jogador tiver menos de três pedras, ele deve mover todas as pedras restantes, se isso não for possível, ele perde o jogo). As pedras escolhidas não precisam estar conectadas entre si, mas devem se conseguir deslocar na mesma direção. Além disso, um jogador não pode mover as suas pedras se uma das células-alvo estiver ocupada com outra pedra do jogador. Se algumas das células-alvo (ou todas elas) estiverem ocupadas com pedras do oponente, as pedras do oponente são capturadas e removidas do tabuleiro.

* #### **Exemplo de possível movimento no início do jogo:**
![Dinâmicas do jogo](/move.png)

- [Todas as informações foram retiradas do site igGameCenter na secção do jogo Taacoca.](https://www.iggamecenter.com/en/rules/taacoca "Site igGameCenter, secção Taacoca")
- [Também começamos alguns jogos entre nós para entender melhor a dinâmica do jogo em primeira mão.](https://www.iggamecenter.com/en/ "Site igGmaeCenter")

### Lógica do Jogo: Descrever (não basta copiar o código fonte) o projeto e implementação da lógica do jogo em Prolog. O predicado de início de jogo deve ser play/0. Esta secção deve ter informação sobre os seguintes tópicos (até 2400 palavras no total).

####  Representação interna do estado do jogo: indicação de como representam o estado do jogo, incluindo tabuleiro (tipicamente usando lista de listas com diferentes átomos para as peças), jogador atual, e eventualmente peças capturadas e/ou ainda por jogar, ou outras informações que possam ser necessárias (dependendo do jogo). Deve incluir exemplos da representação em Prolog de estados de jogo inicial, intermédio e final, e indicação do significado de cada átomo (ie., como representam as diferentes peças):

- 


#### Visualização do estado de jogo: descrição da implementação do predicado de visualização do estado de jogo. Pode incluir informação sobre o sistema de menus criado, assim como interação com o utilizador, incluindo formas de validação de entrada. O predicado de visualização deverá chamar-se display_game(+GameState), recebendo o estado atual do jogo (que inclui o jogador que efetuará a próxima jogada). Serão valorizadas visualizações apelativas e intuitivas. Serão também valorizadas representações de estado de jogo e implementação de predicados de visualização flexíveis, por exemplo, funcionando para qualquer tamanho de tabuleiro, usando um predicado initial_state(+Size, -GameState) que recebe o tamanho do tabuleiro como argumento e devolve o estado inicial do jogo:

-


#### Execução de Jogadas: Validação e execução de uma jogada, obtendo o novo estado do jogo. O predicado deve chamar-se move(+GameState, +Move, -NewGameState).

-

#### Lista de Jogadas Válidas: Obtenção de lista com jogadas possíveis. O predicado deve chamar-se valid_moves(+GameState, +Player, -ListOfMoves).

-

#### Final do Jogo: Verificação do fim do jogo, com identificação do vencedor. O predicado deve chamar-se game_over(+GameState, -Winner).

-

#### Avaliação do Tabuleiro: Forma(s) de avaliação do estado do jogo. O predicado deve chamar-se value(+GameState, +Player, -Value).

-

#### Jogada do Computador: Escolha da jogada a efetuar pelo computador, dependendo do nível de dificuldade. O predicado deve chamar-se choose_move(+GameState, +Player, +Level, -Move). O nível 1 deverá devolver uma jogada válida aleatória. O nível 2 deverá devolver a melhor jogada no momento (algoritmo greedy), tendo em conta a avaliação do estado de jogo.

-

### Conclusões: Conclusões do trabalho, incluindo limitações do trabalho desenvolvido (known issues), assim como possíveis melhorias identificadas (roadmap) (até 250 palavras).

 

### Bibliografia: Listagem de livros, artigos, páginas Web e outros recursos usados durante o desenvolvimento do trabalho.

- [Todas as informações sobre o jogo foram retiradas do site igGameCenter na secção do jogo Taacoca.](https://www.iggamecenter.com/en/rules/taacoca "Site igGameCenter, secção Taacoca")
- [Também começamos alguns jogos entre nós para entender melhor a dinâmica do jogo em primeira mão.](https://www.iggamecenter.com/en/ "Site igGmaeCenter")
- [O site swi-prolog forneceu algumas informações e documentação úteis relativamente a prolog.](https://www.swi-prolog.org/ "Site swi-prolog")
- [Os powerpoints fornecidos pela cadeira com todo o seu conteúdo também foram úteis.](https://moodle.up.pt/course/view.php?id=1997 "Moodle, cadeira PFL")
