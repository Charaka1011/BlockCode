class MainController {

  private MainView mainView = new MainView();
  private ButtonCollection buttonCollection;
  int lockedIndex = -1;
  boolean firstPress = true;
  
  public MainController(ButtonCollection bc) {
    buttonCollection = bc;
  }

  void drawButtons() {
    mainView.drawButtons(getButtonPos(), getButtonLabel());
  }
  
  void drawCanvas(){
    mainView.drawCanvas();
  }

  public ArrayList<Integer> getButtonPos() {
    ArrayList<Button> buttonArray = buttonCollection.getCollection();
    ArrayList<Integer> values = new ArrayList<Integer>();
    for (int i = 0; i<buttonArray.size(); i++) {
      values.add(buttonArray.get(i).posX);
      values.add(buttonArray.get(i).posY);
    }
    return values;
  }

  public ArrayList<String> getButtonLabel() {
    ArrayList<Button> buttonArray = buttonCollection.getCollection();
    ArrayList<String> values = new ArrayList<String>();
    for (int i = 0; i<buttonArray.size(); i++) {
      values.add(buttonArray.get(i).val);
    }
    return values;
  }
}
void mouseReleased() {
  firstPress = true;
  if (lockedIndex >= 0)
  {
    Button b = buttons.getButton(lockedIndex);
    if (canvas.overCanvas())
    {
      canvas.snapToCanvas(buttons, b);
    } else
    {
      b.posX = b.origX;
      b.posY = b.origY;
    }
  }
  lockedIndex = -1;
}

void mouseDragged()
{
  if (firstPress)
  {
    Button b = buttons.overButton();
    if (b != null)
    {
      lockedIndex = buttons.getIndex(b); 
      b.posX = mouseX-b.ButtonWidth/2;
      b.posY = mouseY-b.ButtonHeight/2;
      if(canvas.overCanvas())
      {
         canvas.removeFromCanvas(buttons, b);
      }
    }
  } else
  {
    if (lockedIndex >= 0)
    {
      Button b = buttons.getButton(lockedIndex);
      b.posX = mouseX-b.ButtonWidth/2;
      b.posY = mouseY-b.ButtonHeight/2;
    }
  }  
  firstPress = false;
}