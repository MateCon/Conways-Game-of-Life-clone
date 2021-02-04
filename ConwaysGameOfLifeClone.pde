color white = #E8E7EE,
      black = #2D3142,
      red = color(255, 100, 100);

int cellSize = 10;
int size[] = {640/cellSize, 480/cellSize};
boolean isPaused = true;

Board board;

void setup() {
  size(640, 480);
  frameRate(10);
  board = new Board(size, cellSize);
}

void draw() {
  background(black);
  if(isPaused) board.showCells();
  else {
    board.update();
  }
  
  if(isPaused) pauseIcon();
}

void mousePressed() {
  for(int x = 0; x < size[0]; x++) {
    for(int y = 0; y < size[1]; y++) {
      if(mouseX >= x * cellSize && mouseX < x * cellSize + cellSize && mouseY >= y * cellSize && mouseY < y * cellSize + cellSize) {
        board.cells[x + y*size[0]].handleClick();
      }
    }
  }
}

void keyPressed() {
  if(key == ' ') {
    isPaused = !isPaused;
    board.updateCells();
  } else if(key == 'r') {
    board = new Board(size, cellSize);
    isPaused = true;
  }
}

void pauseIcon() {
  fill(red, 100);
  rect(cellSize, cellSize, cellSize, cellSize);
}
