class Board {
  int totalCells, cellSize;
  int[] size;
  Cell[] cells;
  
  Board(int[] size, int cellSize) {
    this.totalCells = size[0] * size[1];
    this.size = size;
    this.cellSize = cellSize;
    
    cells = new Cell[totalCells];
    for(int y = 0; y < size[1]; y++) {
      for(int x = 0; x < size[0]; x++) {
        this.cells[x + y*size[0]] = new Cell(x + y*size[0], x, y);
      }
    }
  }
  
  void newGen() {
    int counter, index, nIndex;
    for(int x = 0; x < this.size[0]; x++) {
      for(int y = 0; y < this.size[1]; y++) {
        index = x + y * this.size[0];
        counter = 0;
        for(int nx = x-1; nx <= x+1; nx++) {
          for(int ny = y-1; ny <= y+1; ny++) {
            nIndex = nx + ny * this.size[0];
            if(!(x == nx && y == ny) && nx >= 0 && nx < this.size[0] && ny >= 0 && ny < this.size[1] && board.cells[nIndex].wasAlive) counter++;
          }
        }
        this.cells[index].isAlive = ((this.cells[index].isAlive && (counter == 2 || counter == 3)) || (!this.cells[index].isAlive && counter == 3));
      }
    }
  }
  
  void showCells() {
    for(int index = 0; index < totalCells; index++) {
      this.cells[index].show();
    }
  }
  
  void updateCells() {
    for(int index = 0; index < totalCells; index++) {
      this.cells[index].update();
    }
  }
  
  void update() {
    this.newGen();
    this.updateCells();
    this.showCells();
  }
}
