class HistoriaDoJogo {

  String[] sinopse;

  HistoriaDoJogo() {
    sinopse = new String[] {
      "Titulo do Jogo: Defensores do Cosmos",
      "",
      "Sinopse:",
      "Em um futuro próximo, a humanidade está à beira da extinção.",
      "Após anos de paz e prosperidade, o Sistema Solar é ameaçado por",
      "uma vasta chuva de meteoros, que se aproxima rapidamente da Terra.",
      "A única esperança da humanidade reside na força defensiva de uma",
      "nave espacial avançada, a \"Defensor Estelar\".",
      "",
      "Os jogadores assumem o papel do capitão desta nave de combate de elite,",
      "equipada com as mais avançadas tecnologias de defesa e armamentos.",
      "A missão é clara: proteger a Terra dos meteoros e garantir a sobrevivência",
      "da civilização humana.",
      "",
    };
  }

  void render() {
    background(255); // Exemplo de fundo para "Historia do Jogo"
    fill(0);
    textSize(24);
    textAlign(CENTER, CENTER);

    // Calcular a posição inicial para centralizar o texto verticalmente
    float startY = (height - (sinopse.length * 32)) / 2;

    for (int i = 0; i < sinopse.length; i++) {
      text(sinopse[i], width / 2, startY + i * 32);
    }
  }
}
