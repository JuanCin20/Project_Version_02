/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package WallPaper_Background;

import javax.swing.border.Border;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.URI;
import java.nio.file.Paths;
import java.io.File;
import javax.imageio.ImageIO;
import java.util.logging.Logger;
import java.util.logging.Level;
import java.awt.Component;
import java.awt.Graphics;
import java.awt.Insets;

/**
 *
 * @author JuanCin20
 */
public class WallPaper_Background implements Border {

    private BufferedImage Obj_BufferedImage;

    public WallPaper_Background() throws IOException {
        try {
            URI Obj_URI = (Paths.get("src//main//java//Imágenes//Wallpaper_01.png")).toUri();
            File Obj_File = new File(Obj_URI);
            Obj_BufferedImage = ImageIO.read(Obj_File);
        } catch (IOException Obj_IOException) {
            Logger.getLogger(WallPaper_Background.class.getName()).log(Level.SEVERE, Obj_IOException.getMessage());
        }
    }

    @Override
    public void paintBorder(Component Obj_Component, Graphics Obj_Graphics, int Coordinate_X, int Coordinate_Y, int Width, int Height) {
        if (Obj_BufferedImage != null);
        {
            Obj_Graphics.drawImage(Obj_BufferedImage, 0, 0, Width, Height, null);
        }
    }

    @Override
    public Insets getBorderInsets(Component Obj_Component) {
        return new Insets(0, 0, 0, 0);
    }

    @Override
    public boolean isBorderOpaque() {
        return false;
    }
}