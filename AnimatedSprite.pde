class AnimatedSprite {
  PImage[] spriteImages;
  int currentFrame;
  float x, y;
  int lastFrameTime;
  int frameInterval;

  AnimatedSprite(PImage[] spriteImages, float x, float y, int frameInterval) {
    this.spriteImages = spriteImages;
    this.x = x;
    this.y = y;
    this.currentFrame = 0;
    this.lastFrameTime = millis();
    this.frameInterval = frameInterval;
  }

  void display() {
    image(spriteImages[currentFrame], x, y);
    // Verifica se é hora de mudar para o próximo frame
    if (millis() - lastFrameTime > frameInterval) {
      currentFrame = (currentFrame + 1) % spriteImages.length;
      lastFrameTime = millis();
    }
  }

  void checkHover(float mouseX, float mouseY) {
    // Implemente conforme necessário
  }
}
