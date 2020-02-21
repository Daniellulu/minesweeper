import de.bezier.guido.*;
public final static int NUM_ROWS = 5;
public final static int NUM_COLS = 5;
public final static int NUM_BOMBS = 8;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> mines = new ArrayList <MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);
    
    // make the manager
    Interactive.make( this );
    
    //your code to initialize buttons goes here
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for(int r = 0; r< NUM_ROWS; r ++)
    for(int c = 0; c<NUM_COLS; c++)
    buttons[r][c] = new MSButton(r,c);

    
    
    setMines();
}
public void setMines()
{
  while(mines.size() < NUM_BOMBS){
    int xcord =(int) (Math.random() * NUM_ROWS);
    int ycord =(int) (Math.random() * NUM_COLS);
    if(!mines.contains(buttons[xcord][ycord]))
    mines.add(buttons[xcord][ycord]);
}
}

public void draw ()
{
    background( 0 );
    if(isWon() == true)
        displayWinningMessage();
}
public boolean isWon()
{
    //your code here
    return false;
}
public void displayLosingMessage()
{
  textSize(50);
    background(0);
    text( "BOOM",50,250);
    
}
public void displayWinningMessage()
{
    //your code here
}
public boolean isValid(int r, int c)
{
    if(r < NUM_ROWS && c <NUM_COLS)
    return true;
    return false;
}
public int countMines(int row, int col)
{
    int numMines = 0;
    if(isValid( row, col-1) == true && mines.contains(buttons [row] [col-1]) == true)
                      numMines++;
                      if(isValid( row, col+1) == true && mines.contains(buttons[row] [col+1]) == true)
                      numMines++;
                      if(isValid( row-1, col) == true &&mines.contains(buttons [row - 1] [col]) == true)
                      numMines ++;
                      if(isValid( row-1, col-1) == true && mines.contains(buttons [row - 1] [col-1]) == true)
                      numMines ++;
                      if(isValid( row-1, col+1) == true && mines.contains(buttons [row - 1] [col+1]) == true)
                      numMines ++;
                      if(isValid( row+1, col) == true && mines.contains(buttons [row + 1] [col]) == true)
                      numMines ++;
                      if(isValid( row+1, col+1) == true && mines.contains(buttons [row + 1] [col+1]) == true)
                      numMines ++;
                      if(isValid( row+1, col-1) == true && mines.contains(buttons [row + 1] [col-1]) == true)
                      numMines ++;
                      return numMines;
}
public class MSButton
{
    private int myRow, myCol;
    private float x,y, width, height;
    private boolean clicked, flagged;
    private String myLabel;
    
    public MSButton ( int row, int col )
    {
         width = 400/NUM_COLS;
         height = 400/NUM_ROWS;
        myRow = row;
        myCol = col; 
        x = myCol*width;
        y = myRow*height;
        myLabel = "";
        flagged = clicked = false;
        Interactive.add( this ); // register it with the manager
    }

    // called by manager
    public void mousePressed () 
    {
        clicked = true;
        if(mouseButton == RIGHT){
        flagged = !flagged;
        if(flagged == false){
        clicked = false;
        }
        }
        else if(mines.contains(this)){
           displayLosingMessage();
        }else if( countMines(myRow,myCol) >0){
          setLabel( countMines(myRow,myCol));
        }else if(isValid( myRow,myCol-1) == true && clicked == false)
                      buttons[myRow][myCol-1].mousePressed();
                      if(isValid( myRow, myCol+1) == true  && clicked == false)
                      numMines++;
                      if(isValid( row-1, col) == true && clicked == false)
                      numMines ++;
                      if(isValid( row-1, col-1) == true && clicked == false)
                      numMines ++;
                      if(isValid( row-1, col+1) == true && clicked == false)
                      numMines ++;
                      if(isValid( row+1, col) == true && clicked == false)
                      numMines ++;
                      if(isValid( row+1, col+1) == true && clicked == false)
                      numMines ++;
                      if(isValid( row+1, col-1) == true && clicked == false)
                      numMines ++;
                      return numMines;{
         
        }
        
        
        
    }
    public void draw () 
    {    
        if (flagged)
            fill(0);
         else if( clicked && mines.contains(this) ) 
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else 
            fill( 100 );

        rect(x, y, width, height);
        fill(0);
        text(myLabel,x+width/2,y+height/2);
    }
    public void setLabel(String newLabel)
    {
        myLabel = newLabel;
    }
    public void setLabel(int newLabel)
    {
        myLabel = ""+ newLabel;
    }
    public boolean isFlagged()
    {
        return flagged;
    }
}
