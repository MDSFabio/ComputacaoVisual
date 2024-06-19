class Jogador {



  //Variaveis

  int x;
  int y;

  int w;
  int h;

  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isMovingFront;
  boolean isMovingBack;



  int speed;
  PImage imagemNave;

  //Construtor
  Jogador(int iniciaX, int iniciaY, int iniciaW, int iniciaH, PImage imagemNave) {

    x = iniciaX;
    y = iniciaY;
    w = iniciaW;
    h = iniciaH;
    this.imagemNave = imagemNave;


    isMovingLeft = false;
    isMovingRight = false;
    isMovingFront = false;
    isMovingBack = false;
    speed = 10;
  }

  //Funções

  void render() {
    image(imagemNave, x, y, w, h);
    //rect(x, y, w, h);
  }

  void move() {
    if (isMovingLeft == true) {
      x -= speed;
    }
    if (isMovingRight == true) {
      x += speed;
    }
    if (isMovingFront == true) {
      y -= speed;
    }
    if (isMovingBack == true) {
      y += speed;
    }
  }
}
