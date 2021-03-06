class MainView {
  private Button bref = new Button();
  private int Bwidth = bref.buttonWidth*12, Bheight = bref.buttonHeight*17/2;
  private final int text = color(236, 236, 236);
  private final int button = color(30, 139, 195);
  private int posX = 0, posY = 0;
  private String val = "";
  private boolean isSmart = false;
  private String buildTerminalText = "Build Terminal:";
  
  public void drawButtons(ArrayList<Integer> pos, ArrayList<String> labels, ArrayList<Boolean> isSmart) {
    int j = 0;
    for (int i =0; i<labels.size(); i++) {
      this.posX = pos.get(j++);
      this.posY = pos.get(j++);
      this.val = labels.get(i);
      this.isSmart = isSmart.get(i);
      if (this.isSmart) {
        if (overBlock()) {
          fill(30, 130, 76);
          noStroke();
        } else {
          fill(0, 177, 106);
          noStroke();
        }
      } else if (overBlock()) {
        fill(68,108,179);
        noStroke();
      } else {
        fill(30, 139, 195);
        noStroke();
      }
      rect(this.posX, this.posY, this.Bwidth, this.Bheight, 30);
      fill(text);
      textSize(width/47);
      textAlign(CENTER, CENTER);
      text(val, posX + width/11, posY + height/50);
    }
  }

  boolean overBlock() {
    if (mouseX >= posX && mouseX <= posX+this.Bwidth && mouseY >= posY && mouseY <= posY+this.Bheight) 
    {
      return true;
    } else 
    {
      return false;
    }
  }

  public void drawCanvas() {
    fill(8, 22, 37);
    noStroke();
    rect(0, 0, width, height/14);
    buildButton.drawButton();
    resetButton.drawButton();
    exitButton.drawButton();
    fill(0);
    rect(0, height-(height/10), width, height/10);
    fill(255);
    textSize(height/40);
    textAlign(LEFT);
    text(buildTerminalText, 5, height/25 + height - (height/10));
  }
  
  public void appendBuildTerminalText(String s)
  {
    this.buildTerminalText = buildTerminalText + s;
  }
  public void resetBuildTerminalText()
  {
    this.buildTerminalText = "Build Terminal:";
  }
}