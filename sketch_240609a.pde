import processing.sound.*;
import java.util.ArrayList;

// Variáveis
Jogador j1;

HistoriaDoJogo historiaJogo;
Integrantes integrantes;

SoundFile sound;
SoundFile soundMeteoro;


//Naves
PImage nave;
PImage naveDois;

//Meteoro
PImage meteoro;


//Lista de tiro
ArrayList<Bullet> bulletList;

//Lista de Inimigos
ArrayList<Inimigo> inimigosList;

// Variável para armazenar o estado atual da tela
int tela = 0;
boolean jogoEmAndamento = false; // Variável para indicar se o jogo está em andamento

// Variável para armazenar a nave selecionada
PImage naveSelecionada;

// Variáveis para contagem de meteoros
int meteorosDestruidos = 0;
int meteorosRestantes = 0;

//Fonte
PFont font;

//Imagens para Sprite
PImage ImagemUm;
PImage SpriteImagemUm;

PImage ImagemDois;
PImage SpriteImagemDois;

PImage ImagemTres;
PImage SpriteImageTres;

PImage ImagemQuatro;
PImage SpriteImagemQuatro;

PImage ImagemCinco;
PImage SpriteImagemCinco;

AnimatedSprite estrelaUm;
AnimatedSprite estrelaDois;
AnimatedSprite estrelaTres;
AnimatedSprite estrelaQuatro;
AnimatedSprite estrelaCinco;

AnimatedSprite estrelaSeis;
AnimatedSprite estrelaSete;
AnimatedSprite estrelaOito;
AnimatedSprite estrelaNove;
AnimatedSprite estrelaDez;
AnimatedSprite estrelaOnze;
AnimatedSprite estrelaDoze;
AnimatedSprite estrelaTreze;
AnimatedSprite estrelaCatorze;
AnimatedSprite estrelaQuinze;


void setup() {

  //Imagems estrelas Sprite Jogo
  ImagemUm = loadImage("imagemEstrelaUm.png");
  SpriteImagemUm = loadImage("ImagemSpriteEstrelaUm.png");

  ImagemDois = loadImage("ImagemEstrelaDois.png");
  SpriteImagemDois = loadImage("ImagemSpriteEstrelaDois.png");

  ImagemTres = loadImage("ImagemEstrelaTres.png");
  SpriteImageTres = loadImage("ImgemSpriteEstrelaTres.png");

  ImagemQuatro = loadImage("ImagemEstrelaQuatro.png");
  SpriteImagemQuatro = loadImage("ImagemSpritEstrelaQuatro.png");

  ImagemCinco = loadImage("ImagemEstrelaCinco.png");
  SpriteImagemCinco = loadImage("ImagemSpritCinco.png");

  PImage[] spritesEstrelaUm = {ImagemUm, SpriteImagemUm};
  PImage[] spritesEstrelaDois = {ImagemDois, SpriteImagemDois};
  PImage[] spritesEstrelaTres = {ImagemTres, SpriteImageTres};
  PImage[] spritesEstrelaQuatro = {ImagemQuatro, SpriteImagemQuatro};
  PImage[] spritesEstrelaCinco = {ImagemCinco, SpriteImagemCinco};

  // Calcula a posição central do menu
  float centerX = width / 2;
  float centerY = height / 2;

  // Define as distâncias para os sprites animados ao redor do menu
  float distance = 100; // Distância do centro para os sprites animados

  // Posiciona os sprites animados ao redor do menu
  estrelaUm = new AnimatedSprite(spritesEstrelaUm, centerX, centerY - 3 * distance, 1000); // Acima
  estrelaDois = new AnimatedSprite(spritesEstrelaDois, centerX - 3 * distance, centerY, 1000); // À esquerda
  estrelaTres = new AnimatedSprite(spritesEstrelaTres, centerX + 3 * distance, centerY, 1000); // À direita
  estrelaQuatro = new AnimatedSprite(spritesEstrelaQuatro, centerX, centerY + 3 * distance, 1000); // Abaixo
  estrelaCinco = new AnimatedSprite(spritesEstrelaCinco, centerX - 2 * distance, centerY - 3 * distance, 1000); // Acima à esquerda
  estrelaSeis = new AnimatedSprite(spritesEstrelaUm, centerX + 2 * distance, centerY - 3 * distance, 1000); // Acima à direita
  estrelaSete = new AnimatedSprite(spritesEstrelaDois, centerX - 2 * distance, centerY + 3 * distance, 1000); // Abaixo à esquerda
  estrelaOito = new AnimatedSprite(spritesEstrelaTres, centerX + 2 * distance, centerY + 3 * distance, 1000); // Abaixo à direita
  estrelaNove = new AnimatedSprite(spritesEstrelaCinco, centerX - 3 * distance, centerY - 2 * distance, 1000); // Acima à esquerda
  estrelaDez = new AnimatedSprite(spritesEstrelaUm, centerX + 3 * distance, centerY - 2 * distance, 1000); // Acima à direita
  estrelaOnze = new AnimatedSprite(spritesEstrelaDois, centerX - 3 * distance, centerY + 2 * distance, 1000); // Abaixo à esquerda
  estrelaDoze = new AnimatedSprite(spritesEstrelaTres, centerX + 3 * distance, centerY + 2 * distance, 1000); // Abaixo à direita
  //estrelaTreze = new AnimatedSprite(spritesEstrelaCinco, width / 2 - 100 + (0 - 1) * 50, height / 2 + (0 - 6) * 50, 40, 40, 1000);

  // Sons
  soundMeteoro = new SoundFile(this, "medium-explosion-40472.mpeg");
  sound = new SoundFile(this, "laser-45816.mpeg");

  // Inicialização Tamanho Tela
  size(1200, 800);

  // Carrega a fonte vetorial
  font = createFont("SpaceMission-rgyw9.otf", 32);
  textFont(font);

  // Carrega imagens
  nave = loadImage("navePrincipalUm.jpeg");
  naveDois = loadImage("navePrincipalDois.png");
  meteoro = loadImage("meteoroUm.jpeg");

  // Inicializa jogador com uma nave padrão
  j1 = new Jogador(width / 2, height - 50, 50, 50, nave);

  // Inicializa tela de História do Jogo
  historiaJogo = new HistoriaDoJogo();

  // Inicializa tela de Integrantes
  integrantes = new Integrantes();



  // Lista de tiros
  bulletList = new ArrayList<Bullet>();

  // Lista de inimigos
  inimigosList = new ArrayList<Inimigo>();


  // Inicializa contadores
  meteorosDestruidos = 0;
  meteorosRestantes = inimigosList.size();
}

void draw() {
  if (tela == 0) {
    drawMenu();
  } else if (tela == 1) {
    drawSelecaoNave();
  } else if (tela == 2) {
    if (jogoEmAndamento) {
      drawGame();
    } else {
      drawNiveis();
    }
  } else if (tela == 3) {
    historiaJogo.render();
  } else if (tela == 4) {
    integrantes.render();
  }
}

void drawMenu() {
  background(255);
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Defensores do Cosmos", width / 2, height / 2 - 120);
  text("Comecar Jogo", width / 2, height / 2 - 60);
  text("Historia do Jogo", width / 2, height / 2);
  text("Creditos", width / 2, height / 2 + 60);

  estrelaUm.display();
  estrelaDois.display();
  estrelaTres.display();
  estrelaQuatro.display();
  estrelaCinco.display();

  estrelaSeis.display();
  estrelaSete.display();
  estrelaOito.display();
  estrelaNove.display();
  estrelaDez.display();
  estrelaOnze.display();
  estrelaDoze.display();
  //estrelaTreze.display();
  //estrelaCatorze.display();
  //estrelaQuinze.display();
}

void drawSelecaoNave() {
  background(255);
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Selecione sua Nave", width / 2, height / 2 - 100);
  image(nave, width / 2 - 200, height / 2, 100, 100);
  image(naveDois, width / 2 + 100, height / 2, 100, 100);
}

void drawNiveis() {
  background(255);
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text("Nivel 1", width / 2, height / 2 - 60);
  text("Nivel 2", width / 2, height / 2);
  text("Nivel 3", width / 2, height / 2 + 60);
}

void drawGame() {
  background(255);

  // Jogador
  j1.render();
  j1.move();

  // Inimigo
  for (Inimigo adversario : inimigosList) {
    adversario.move();
    adversario.render();
  }

  // For loop para passar pela lista de tiros
  for (Bullet disparo : bulletList) {
    disparo.render();
    disparo.move();
    disparo.checkRemove();

    for (Inimigo adversario : inimigosList) {
      disparo.shootEnemy(adversario);
    }
  }

  // For remove disparos
  for (int i = bulletList.size() - 1; i >= 0; i--) {
    Bullet disparo = bulletList.get(i);
    if (disparo.shouldRemove) {
      bulletList.remove(disparo);
    }
  }

  // For remove inimigos
  for (int i = inimigosList.size() - 1; i >= 0; i--) {
    Inimigo adversario = inimigosList.get(i);
    if (adversario.shouldRemove) {
      if (soundMeteoro.isPlaying()) {
        soundMeteoro.stop();
      }
      soundMeteoro.play();
      inimigosList.remove(adversario);
      meteorosDestruidos++;
      meteorosRestantes--;
    }
  }

  // Exibir contadores
  fill(0);
  textSize(24);
  text("Meteoros Destruidos: " + meteorosDestruidos, 150, 30);
  text("Meteoros Restantes: " + meteorosRestantes, 150, 60);
}

void mousePressed() {
  if (tela == 0) {
    if (mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
      if (mouseY > height / 2 - 80 && mouseY < height / 2 - 40) {
        tela = 1; // Mostra opções de seleção de nave ao clicar em "Começar Jogo"
      } else if (mouseY > height / 2 - 20 && mouseY < height / 2 + 20) {
        tela = 3; // Muda para a tela "História do Jogo"
      } else if (mouseY > height / 2 + 40 && mouseY < height / 2 + 80) {
        tela = 4; // Muda para a tela "Integrantes"
      }
    }
  } else if (tela == 1) {
    if (mouseX > width / 2 - 200 && mouseX < width / 2 - 100 && mouseY > height / 2 && mouseY < height / 2 + 100) {
      naveSelecionada = nave;
      j1 = new Jogador(width / 2, height - 50, 50, 50, naveSelecionada);
      tela = 2; // Vai para a tela de seleção de níveis
    } else if (mouseX > width / 2 + 100 && mouseX < width / 2 + 200 && mouseY > height / 2 && mouseY < height / 2 + 100) {
      naveSelecionada = naveDois;
      j1 = new Jogador(width / 2, height - 50, 50, 50, naveSelecionada);
      tela = 2; // Vai para a tela de seleção de níveis
    }
  } else if (tela == 2) {
    if (!jogoEmAndamento) {
      if (mouseX > width / 2 - 100 && mouseX < width / 2 + 100) {
        if (mouseY > height / 2 - 80 && mouseY < height / 2 - 40) {
          // Clicou em "Nível 1"
          iniciarJogo(1);
        } else if (mouseY > height / 2 - 20 && mouseY < height / 2 + 20) {
          // Clicou em "Nível 2"
          iniciarJogo(2);
        } else if (mouseY > height / 2 + 40 && mouseY < height / 2 + 80) {
          // Clicou em "Nível 3"
          iniciarJogo(3);
        }
      }
    }
  } else {
    // Volta para o menu principal se qualquer tela for clicada
    tela = 0;
  }
}

void iniciarJogo(int nivel) {
  // Limpa a lista de inimigos
  inimigosList.clear();

  if (nivel == 1) {
    // Adiciona inimigos para o Nível 1
    inimigosList.add(new Inimigo(800, -1000, 25, 25, meteoro));
    inimigosList.add(new Inimigo(600, 300, 50, 25, meteoro));
  } else if (nivel == 2) {
    // Adiciona inimigos para o Nível 2
    inimigosList.add(new Inimigo(800, -1000, 25, 25, meteoro));
    inimigosList.add(new Inimigo(600, 300, 50, 25, meteoro));
    inimigosList.add(new Inimigo(200, -200, 30, 30, meteoro));
  } else if (nivel == 3) {
    // Adiciona inimigos para o Nível 3
    inimigosList.add(new Inimigo(800, -1000, 25, 25, meteoro));
    inimigosList.add(new Inimigo(600, 300, 50, 25, meteoro));
    inimigosList.add(new Inimigo(200, -200, 30, 30, meteoro));
    inimigosList.add(new Inimigo(400, 100, 45, 45, meteoro));
    inimigosList.add(new Inimigo(700, -500, 50, 50, meteoro));
  }

  // Inicializa contadores
  meteorosDestruidos = 0;
  meteorosRestantes = inimigosList.size();

  jogoEmAndamento = true;
}

void keyPressed() {
  if (jogoEmAndamento) { // Só processa teclas no modo de jogo
    if (key == 'a') {
      j1.isMovingLeft = true;
    }
    if (key == 'd') {
      j1.isMovingRight = true;
    }
    if (key == 'w') {
      j1.isMovingFront = true;
    }
    if (key == 's') {
      j1.isMovingBack = true;
    }
    if (key == ' ') {
      bulletList.add(new Bullet(j1.x, j1.y));
      if (sound.isPlaying()) {
        sound.stop();
      }
      sound.play();
    }
  }
}

void keyReleased() {
  if (jogoEmAndamento) { // Só processa teclas no modo de jogo
    if (key == 'a') {
      j1.isMovingLeft = false;
    }
    if (key == 'd') {
      j1.isMovingRight = false;
    }
    if (key == 'w') {
      j1.isMovingFront = false;
    }
    if (key == 's') {
      j1.isMovingBack = false;
    }
  }
}
