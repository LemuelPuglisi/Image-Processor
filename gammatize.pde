
int current_frame; 

PImage I, I_resized; 

boolean edits; 

Transformer T; 

void settings()
{
    current_frame = 20; 
    edits = true; 

    I = loadImage("analyzable/output_00" + current_frame + ".png");

    I_resized = I.get(250, 250, 1000, 500); 

    T = new Transformer(I_resized);

    size(I_resized.width, I_resized.height);  
}

void printImage() 
{
    T.s_range = 245; 
    T.e_range = 255; 
    T.print(0, 0); 
}

void setup()
{
    background(0); 
    printImage(); 
}

void draw() 
{
    if (edits) 
    {
        printImage(); 
        println("print t image");  
        edits = false; 
    }
}

void keyPressed()
{

    if      (key == '1') { T.gamma(15);         edits = true; }  
    else if (key == '2') { T.extraLightRemap(); edits = true; }
    else if (key == '3') { T.lookForBinladen(); edits = true; }
    else if (key == '4') { T.negative();        edits = true; }
    else if (key == '5') { T.logarithm_RGB();   edits = true; }
    else if (key == '6') { T.gamma_RGB(2);      edits = true; }
    else if (key == 'r') { T.reset();           edits = true; }


    if (key == ' ') 
    {
        println("current frame: " + current_frame);
         
        if (current_frame < 33) 
        {
            current_frame ++;
            
            I = loadImage("analyzable/output_00" + current_frame + ".png");
            
            I_resized = I.get(0, 0, 1000, 500);

            T.setImage(I_resized);
        }    
        printImage();
    }

    if (key == '-') 
    {
        println("current frame: " + current_frame); 
    
        if (current_frame > 20) 
        {
            current_frame --;
        
            I = loadImage("analyzable/output_00" + current_frame + ".png");
        
            I_resized = I.get(0, 0, 1000, 500);

            T.setImage(I_resized);
        }    
        printImage();
    }

}

