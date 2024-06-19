class Bullet {


  //Variaveis

  int x;
  int y;
  int d;
  int speed;

  boolean shouldRemove;

  int left;
  int right;
  int top;
  int bottom;




  //Construtor

  Bullet(int inicialX, int inicialY) {

    x = inicialX;
    y = inicialY;

    d = 5;

    speed = 15;
    shouldRemove = false;

    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }

  void render() {
    circle(x, y, d);
  }

  void move() {

    y -= speed;

    left = x - d/2;
    right = x + d/2;
    top = y - d/2;
    bottom = y + d/2;
  }

  void checkRemove() {
    if (y < 0) {
      shouldRemove = true;
    }
  }
  void shootEnemy(Inimigo adversario) {

    if (top <= adversario.bottom && bottom >= adversario.top && left <= adversario.right && right >= adversario.left) {
      //adversario.imagemMeteoro =

      adversario.shouldRemove = true;
    }
  }
}
