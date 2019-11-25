
/*
 * Global variables
 *
 */

int current_frame; 

PImage I, I_resized; 
Transformer T; 

void settings()
{
    current_frame = 20; 

    I = loadImage("analyzable/output_00" + current_frame + ".png");

    I_resized = I.get(0, 0, 1000, 500); 

    size(I_resized.width, I_resized.height);  
}



void setup()
{
    background(0);
    T = new Transformer(I); 
    printImage(); 
}

void printImage() 
{
    T.s_range = 245; 
    T.e_range = 255; 
    T.setImage(I); 
    T.extraLightRemap(); 
    T.print(0, 0); 
}

void draw() {}



void keyPressed()
{
    if (key == ' ') {
        if (current_frame < 33)
            current_frame ++; 
        I = loadImage("analyzable/output_00" + current_frame + ".png");
        printImage();
    }
}

