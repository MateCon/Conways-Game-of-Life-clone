class Cell {
  int index, xPos, yPos;
  boolean isAlive = false, wasAlive = false;
  
  Cell(int index, int xPos, int yPos) {
    this.index = index;
    this.xPos = xPos;
    this.yPos = yPos;
  }
  
  void handleClick() {
    this.isAlive = !isAlive;
  }
  
  void show() {
    noStroke();
    if(isAlive) fill(white);
    else fill(black);
    rect(this.xPos * board.cellSize, this.yPos * board.cellSize, board.cellSize, board.cellSize);
  }
  
  void update() {
    this.show();
    wasAlive = isAlive;
  }
}
