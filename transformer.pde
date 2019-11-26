class Transformer 
{
    private PImage original; 
    public  PImage buffer; 

    public int s_range, e_range; 

    public Transformer(PImage target)
    {
        original = target.copy(); 
        buffer = original.copy(); 

        s_range = 200; 
        e_range = 255; 
    }

    public void setImage(PImage new_target) 
    {
        original = new_target.copy(); 
        buffer = original.copy(); 
    }

    public void reset()
    {
        buffer = original.copy(); 
    }

    public void turnGray()
    {
        buffer.filter(GRAY); 
    }

    public void print(int x, int y)
    {
        image(buffer, x, y); 
    }

    public void negative()
    {
        reset(); 

        for (int i = 0; i < buffer.width; i++) {
            for (int j = 0; j < buffer.height; j++) {

                color c = buffer.get(i, j); 
                color k = color(
                    255 - red(c), 
                    255 - green(c), 
                    255 - blue(c)
                ); 
                buffer.set(i, j, k); 
            }
        }

    }

    public void extraLightRemap()
    {
        reset(); 

        for (int i = 0; i < buffer.width; i++) {
            for (int j = 0; j < buffer.height; j++) {

                color c = buffer.get(i, j); 

                float r = red(c);
                float g = green(c); 
                float b = blue(c);  

                float redValue    = map(r, s_range, e_range, 0, 255);
                float greenValue  = map(g, s_range, e_range, 0, 255);
                float blueValue   = map(b, s_range, e_range, 0, 255); 

                color k = color(redValue, greenValue, blueValue); 

                buffer.set(i, j, k); 
            }
        }
    }

    public void lookForBinladen()
    {
        reset(); 
        turnGray(); 

        for (int i = 0; i < buffer.width; i++) {
            for (int j = 0; j < buffer.height; j++) {

                color c = buffer.get(i, j); 
                float L = red(c);

                if (int(L) == 248) {
                    color k = color(0); 
                    buffer.set(i, j, k); 
                }
                else {
                    color w = color(255); 
                    buffer.set(i, j, w); 
                }

            }
        }
    }

    public void gamma(int gamma)
    {
        reset(); 
        turnGray(); 

        for (int i = 0; i < buffer.width; i++) {
            for (int j = 0; j < buffer.height; j++) {

                color k = buffer.get(i, j); 
                
                // Luminance
                float L = red(k);

                // Normalization 
                float c = 255 / pow(255, gamma); 

                // gamma function output
                float s = c * pow(L, gamma);

                // convert into RGB (gray scale) color
                color nc = color(s, s, s);
                
                buffer.set(i, j, nc);  
            }
        }

    }

}

