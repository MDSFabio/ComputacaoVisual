class Inimigo {

  //Variaveis


  int x;
  int y;
  int w;
  int h;


  int left;
  int right;
  int top;
  int bottom;

  boolean shouldRemove;

  int speed;
  PImage imagemMeteoro;
  float angle;

  Inimigo (int inicialX, int inicialY, int inicialW, int inicialH, PImage imagemMeteoro) {

    x = inicialX;
    y = inicialY;
    w = inicialW;
    h = inicialH;
    this.imagemMeteoro = imagemMeteoro;
    angle = 0;



    shouldRemove = false;
    speed = 2; // Define a velocidade do inimigo
    updateBounds();
  }
  void updateBounds() {
    left = x - w / 2;
    right = x + w / 2;
    top = y - h / 2;
    bottom = y + h / 2;
  }

  void render() {
    rectMode(CENTER);
    pushMatrix();
    translate(x, y); // Move a origem para a posição do inimigo
    rotate(angle); // Rotaciona em torno da origem (agora a posição do inimigo)
    imageMode(CENTER);
    image(imagemMeteoro, 0, 0, w, h); // Desenha a imagem centrada na origem
    popMatrix();
    //rectMode(CENTER);
    //image(imagemMeteoro, x, y, w, h);

    //rect (x, y, w, h);
  }
  void moveTowardsPlayer(Jogador jogador) {
    float dx = jogador.x - x;
    float dy = jogador.y - y;
    float distance = sqrt(dx*dx + dy*dy);
    if (distance != 0) {
      x += speed * dx / distance;
      y += speed * dy / distance;
    }
    angle += 0.05;
    updateBounds();
  }
    void move() {
    y += speed; // Move o inimigo para baixo no eixo Y
    angle += 0.05;
    updateBounds();
  }
}
