class ButtonCollection {
  ArrayList<Button> buttons = new ArrayList<Button>();

  ButtonCollection(ArrayList<Button> buttons)
  {
    this.buttons = buttons;
  }
  
  void addButton(Button button)
  {
    buttons.add(button);
  }
  
  void removeButton(Button button)
  {
    buttons.remove(button);
  }
  
  Button getButton(int i)
  {
    return buttons.get(i);
  }
  
  int getIndex(Button b)
  {
    return buttons.indexOf(b);
  }
  
  ArrayList<Button> getCollection()
  {
    return buttons; 
  }
  
  Button overButton()
  {
   for(Button b : buttons)
   {
      if (b.overBlock())
      {
        return b;
      } 
   }
   return null;
  }
}