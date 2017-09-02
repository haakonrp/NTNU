import javax.swing.*;
import static com.jogamp.opengl.GL2.*;
import com.jogamp.opengl.GL2;
import com.jogamp.opengl.glu.GLU;
import com.jogamp.opengl.GLEventListener;
import com.jogamp.opengl.GLAutoDrawable;
import com.jogamp.opengl.GLCapabilities;
import com.jogamp.opengl.awt.GLCanvas;
import static com.jogamp.opengl.fixedfunc.GLMatrixFunc.GL_MODELVIEW;
import static com.jogamp.opengl.fixedfunc.GLMatrixFunc.GL_PROJECTION;
import com.jogamp.opengl.util.FPSAnimator;
import com.jogamp.opengl.util.gl2.GLUT;

import java.awt.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;


public class Oving4 extends GLCanvas implements GLEventListener, KeyListener, MouseListener{

    private double angle;
    private GLU glu = new GLU();
    private GLUT glut = new GLUT();
    private float number = 1.0f;
    private double rotDeg = 0;
    private boolean rotDir = true;
    private boolean rotSide = true;

    public Oving4(GLCapabilities c){
        super(c);
        this.addGLEventListener(this);
        this.addKeyListener(this);
        this.addMouseListener(this);
        final FPSAnimator animator = new FPSAnimator(this, 120);
        animator.start();

    }

    public void init(GLAutoDrawable glDrawable) {
        GL2 gl = glDrawable.getGL().getGL2();
        gl.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);

        gl.glMatrixMode(GL_PROJECTION);
        gl.glLoadIdentity();
        glu.gluPerspective(90.0,1.25,1.0,20.0);
        gl.glMatrixMode(GL_MODELVIEW);
        gl.glLoadIdentity();

        //LIGHT

        float [] ambient = {0.5f, 0.5f, 0.5f, 0.0f};
        float [] diffuse0 = {0.3f, 0.3f, 0.3f, 1.0f};
        float [] position0 = {0f, 0f, 0.0f, 1.0f};

        gl.glEnable(GL_LIGHT0);
        gl.glEnable(GL_LIGHTING);
        gl.glEnable(GL_NORMALIZE);
        gl.glEnable(GL_COLOR_MATERIAL);
        gl.glEnable(GL_DEPTH_TEST);

        gl.glLightfv(GL_LIGHT0, GL_AMBIENT, ambient, 0);
        gl.glLightfv(GL_LIGHT0, GL_DIFFUSE, diffuse0, 0);
        gl.glLightfv(GL_LIGHT0, GL_POSITION, position0, 0);

        gl.glShadeModel(GL_SMOOTH);
        gl.glClearDepth(1.0);
        gl.glEnableClientState(GL_COLOR_ARRAY);
        gl.glEnableClientState(GL_VERTEX_ARRAY);
        gl.glEnableClientState(GL_NORMAL_ARRAY);
        gl.glDepthFunc(GL_LEQUAL);
        gl.glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
        gl.glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE);
    }

    public void reshape(GLAutoDrawable glDrawable, int i, int i1, int width, int height) {}
    public void dispose(GLAutoDrawable d){}

    public void drawGLScene(GLAutoDrawable glDrawable) {
        GL2 gl = glDrawable.getGL().getGL2();
        gl.glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        gl.glLoadIdentity();

        glu.gluLookAt(2, 3, 9, 0, 0, 0, 0, 1, 0); //(pos x, pos y, pos z, look x, look y, look z, boolean x, y, z up);

        gl.glRotated(angle, 0, 1, 0);


        //FIXME: buggy
        //glu.gluLookAt(camPos*0.1f,0, camZoom*0.1f, lookX*0.01f, lookY*0.01f, 0, 0, 1, 0);

        //x,y,z-axis

        drawAxis(gl, 10);

        //drawSurfaceBlock(gl,0);
        //gl.glTranslatef(1f, 0f, 0f);
        //gl.glRotatef(90, 0, 1, 0);
        //drawSurfaceBlock(gl,1);

        /*
        drawSurface(gl, 3, 3, 0);
        gl.glTranslatef(0, -3, 0);
        gl.glRotatef(90, 1, 0, 0);
        drawSurface(gl, 3, 3, 1);
        gl.glTranslatef(0, -3, 0);
        gl.glRotatef(90, 0, 1, 0);
        drawSurface(gl, 3, 3, 2);
        gl.glTranslatef(0, 0, 3);
        gl.glRotatef(-90, 1, 0, 0);
        drawSurface(gl, 3, 3, 4);
        gl.glTranslatef(0, -3, 0);
        gl.glRotatef(-90, 1, 0, 0);
        drawSurface(gl, 3, 3, 3);
        gl.glTranslatef(3, -3, 3);
        gl.glRotatef(90, 0, 1, 0);
        drawSurface(gl, 3, 3, 5);
        */

        //gl.glRotated(rotDeg, 1, 0, 0);


        gl.glPushMatrix();
        gl.glRotated(rotDeg, 0, 0, 1);
        gl.glTranslatef(-1.5f, -1.5f, -1.5f);
        drawRubiksSide(gl);
        gl.glPopMatrix();

        gl.glPushMatrix();
        //gl.glRotated(rotDeg, 0, 0, 1);
        gl.glTranslatef(-1.5f, -1.5f, -0.5f);
        drawRubiksSide(gl);
        gl.glPopMatrix();

        gl.glPushMatrix();
        //gl.glRotated(rotDeg, 0, 0, 1);
        gl.glTranslatef(-1.5f, -1.5f, 0.5f);
        drawRubiksSide(gl);
        gl.glPopMatrix();




    }

    private void update() {
        //cam
        angle += 0.5;
        if(angle > 360) {
            angle -= 360;
        }


        //rubiks
        double[] bp = {-360, -270, -180, -90, 0, 90, 180, 270, 360};
        for(int i = 0; i < bp.length; i++) {
            if(!rotSide && rotDeg == bp[i]) {
                System.out.println("helo");
            }
        }


        if(rotDir) {
            rotDeg += 0.5;
        } else {
            rotDeg -= 0.5;
        }
        if(rotDeg > 360 || rotDeg < -360) {
            rotDeg = 0;
        }
        System.out.println("rotDeg: " + rotDeg);
    }


    private void drawRubiksSide(GL2 gl) {
        gl.glPushMatrix();
        gl.glTranslatef(0.5f, 0.5f, 0.5f);
        drawRubiksCube(gl,1);
        gl.glTranslatef(1.5f, -0.5f, -0.5f);
        drawRubiksCube(gl,1);
        gl.glTranslatef(1.5f, -0.5f, -0.5f);
        drawRubiksCube(gl,1);
        gl.glPopMatrix();

        gl.glPushMatrix();
        gl.glTranslatef(0.5f, 1.5f, 0.5f);
        drawRubiksCube(gl,1);
        gl.glTranslatef(1.5f, -0.5f, -0.5f);
        drawRubiksCube(gl,1);
        gl.glTranslatef(1.5f, -0.5f, -0.5f);
        drawRubiksCube(gl,1);
        gl.glPopMatrix();

        gl.glPushMatrix();
        gl.glTranslatef(0.5f, 2.5f, 0.5f);
        drawRubiksCube(gl,1);
        gl.glTranslatef(1.5f, -0.5f, -0.5f);
        drawRubiksCube(gl,1);
        gl.glTranslatef(1.5f, -0.5f, -0.5f);
        drawRubiksCube(gl,1);
        gl.glPopMatrix();

    }

    private void drawSurfaceBlock(GL2 gl, int color) {
        float[][] coords = {{0,1,0},{1,1,0},{1,0,0},{0,0,0}};
        final float colors[][] = {{1.0f, 1.0f, 1.0f}, {1.0f, 0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}, {0.0f, 0.0f, 1.0f}, {1.0f, 1.0f, 0.0f}, {1.0f, 0.5f, 0.0f}, {0f, 0f, 0f}};
        gl.glColor3fv(colors[color], 0);
        gl.glBegin(GL_QUADS);
        gl.glVertex3fv(coords[0], 0);
        gl.glVertex3fv(coords[1], 0);
        gl.glVertex3fv(coords[2], 0);
        gl.glVertex3fv(coords[3], 0);
        gl.glEnd();

        gl.glColor3fv(colors[6], 0);
        gl.glLineWidth(2f);
        gl.glBegin(GL_LINE_LOOP);
        gl.glVertex3fv(coords[0], 0);
        gl.glVertex3fv(coords[1], 0);
        gl.glVertex3fv(coords[2], 0);
        gl.glVertex3fv(coords[3], 0);
        gl.glEnd();
    }

    private void drawSurface(GL2 gl, int size, int color) {
        for(int i = 0; i < size; i++) {
            for(int j = 0; j < size; j++) {
                drawSurfaceBlock(gl, color);
                gl.glTranslatef(1, 0, 0);
            }
            gl.glTranslatef(-size, 1, 0);
        }
    }

    private void drawRubiksCube(GL2 gl, int size) {
        gl.glTranslatef(-((float)size/2), -((float)size/2), -((float)size/2));
        drawSurface(gl, size, 0);
        gl.glTranslatef(0, -size, 0);
        gl.glRotatef(90, 1, 0, 0); //90 deg
        drawSurface(gl, size, 1);
        gl.glTranslatef(0, -size, 0);
        gl.glRotatef(90, 0, 1, 0);
        drawSurface(gl, size, 2);
        gl.glTranslatef(0, 0, size);
        gl.glRotatef(-90, 1, 0, 0);
        drawSurface(gl, size, 4);
        gl.glTranslatef(0, -size, 0);
        gl.glRotatef(-90, 1, 0, 0);
        drawSurface(gl, size, 3);
        gl.glTranslatef(size, -size, size);
        gl.glRotatef(90, 0, 1, 0);
        drawSurface(gl, size, 5);
    }

    private void drawPolygon(GL2 gl, int a, int b, int c, int d) {
        final float corners[][] = {{-1f,-0.1f,0.1f}, {-0.1f,0.1f,0.1f}, {0.1f,0.1f,0.1f}, {0.1f,-0.1f,0.1f}, {-0.1f,-0.1f,-0.1f}, {-0.1f,0.1f,-0.1f}, {0.1f,0.1f,-0.1f}, {0.1f,-0.1f,-0.1f}};
        final float colors[][] = {{1.0f, 1.0f, 1.0f}, {1.0f, 0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}, {0.0f, 0.0f, 1.0f}, {1.0f, 1.0f, 0.0f}, {1.0f, 0.5f, 0.0f}};

        gl.glColor3fv(colors[a],0);
        gl.glBegin(GL_QUADS);
        {
            gl.glVertex3fv(corners[a],1);
            gl.glVertex3fv(corners[b],1);
            gl.glVertex3fv(corners[c],1);
            gl.glVertex3fv(corners[d],1);
        }
        gl.glEnd();
    }

    private void drawRubiks2(GL2 gl) {
        final float[][] colors = {{1.0f, 1.0f, 1.0f}, {1.0f, 0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}, {0.0f, 0.0f, 1.0f}, {1.0f, 1.0f, 0.0f}, {1.0f, 0.5f, 0.0f}};
        float[] sides = new float[6];
        float[][] pieces = new float[6][9];

        for(int i = 0; i < 6; i++) {
            for(int j = 0; j < 9; j++) {
            }
        }
    }

    private void drawRubiks(GL2 gl) {
        //glut.glutSolidCube(1f);
        //gl.glTranslatef(0f, 0f, 7f);
        final float colors[][] = {{1.0f, 1.0f, 1.0f}, {1.0f, 0.0f, 0.0f}, {0.0f, 1.0f, 0.0f}, {0.0f, 0.0f, 1.0f}, {1.0f, 1.0f, 0.0f}, {1.0f, 0.5f, 0.0f}};
        for(int i = 0; i < 1; i++) {
            switch(i) {
                case 0:
                    gl.glTranslatef(-0.33f, 0.33f, 0.33f);

                    gl.glColor3fv(colors[i], 1);
                    for(int j = 0; j < 11; j++) {
                        if(j == 3) {
                            gl.glTranslatef(-0.99f, -0.33f, 0f);
                            glut.glutSolidCube(0.32f);
                        } else if(j == 7) {
                            gl.glTranslatef(-0.99f, -0.33f, 0f);
                            glut.glutSolidCube(0.32f);
                        } else {
                            glut.glutSolidCube(0.32f);
                            gl.glTranslatef(0.33f, 0f, 0f);
                        }
                    }

                    break;

                case 1:
                    gl.glTranslatef(-0.33f, 0.33f, 0.33f);
                    gl.glColor3fv(colors[i], 1);
                    for(int j = 0; j < 9; j++) {
                        gl.glPushMatrix();

                        if(j == 3 || j == 7) {
                            gl.glPopMatrix();
                            gl.glTranslatef(0f, -0.33f, 0f);
                            glut.glutSolidCube(0.32f);
                        } else {
                            glut.glutSolidCube(0.32f);
                            gl.glTranslatef(0.33f, 0f, 0f);
                        }
                    }

                    break;

                case 2:
                    gl.glPushMatrix();
                    gl.glColor3fv(colors[i], 1);
                    for(int j = 0; j < 9; j++) {
                        gl.glTranslatef(-0.33f*(float)j, 0.33f, 0);
                        glut.glutSolidCube(0.32f);
                    }
                    gl.glPopMatrix();

                    break;

                case 3:
                    gl.glPushMatrix();
                    gl.glColor3fv(colors[i], 1);
                    for(int j = 0; j < 9; j++) {
                        gl.glTranslatef(-0.33f*(float)j, 0.33f, 0);
                        glut.glutSolidCube(0.32f);
                    }
                    gl.glPopMatrix();

                    break;

                case 4:
                    gl.glPushMatrix();
                    gl.glColor3fv(colors[i], 1);
                    for(int j = 0; j < 9; j++) {
                        gl.glTranslatef(-0.33f*(float)j, 0.33f, 0);
                        glut.glutSolidCube(0.32f);
                    }
                    gl.glPopMatrix();

                    break;

                case 5:
                    gl.glPushMatrix();
                    gl.glColor3fv(colors[i], 1);
                    for(int j = 0; j < 9; j++) {
                        gl.glTranslatef(-0.33f*(float)j, 0.33f, 0);
                        glut.glutSolidCube(0.32f);
                    }
                    gl.glPopMatrix();

                    break;


            }
        }
    }


    private void drawAxis(GL2 gl, float length) {
        //axis
        gl.glBegin(GL_LINES);
        gl.glColor3f(1f, 0f, 0f);
        gl.glVertex3f(length, 0f, 0f);
        gl.glVertex3f(-length, 0f, 0f);
        gl.glColor3f(0f, 1f, 0f);
        gl.glVertex3f(0f, length, 0f);
        gl.glVertex3f(0f, -length, 0f);
        gl.glColor3f(0f, 0f, 1f);
        gl.glVertex3f(0f, 0f, length);
        gl.glVertex3f(0f, 0f, -length);
        gl.glEnd();

        gl.glColor3f(1f, 1f, 1f);
        gl.glLineWidth(3f);
        //counters
        gl.glBegin(GL_LINES);
        for(int i = (int) -length; i < length; i++) {
            gl.glVertex3f(((float) i), 0.05f, 0f);
            gl.glVertex3f(((float) i), -0.05f, 0f);
        }

        for(int i = (int) -length; i < length; i++) {
            gl.glVertex3f(0.05f, ((float) i), 0f);
            gl.glVertex3f(-0.05f, ((float) i), 0f);
        }

        for(int i = (int) -length; i < length; i++) {
            gl.glVertex3f(0f, 0.05f, ((float) i));
            gl.glVertex3f(0f, -0.05f, ((float) i));
        }
        gl.glEnd();
        gl.glLineWidth(1f);
    }


    public void display(GLAutoDrawable glDrawable) {
        update();
        drawGLScene(glDrawable);                      // Calls drawGLScene

    }


    public void displayChanged(GLAutoDrawable glDrawable, boolean b, boolean b1) {}

    public static void main(String[] args){
        GLCanvas canvas = new Oving4(null);
        canvas.setPreferredSize(new Dimension(1280,1024));

        final JFrame frame = new JFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.getContentPane().add(canvas);

        frame.setTitle("Oving4");
        frame.pack();
        frame.setVisible(true);
    }

    @Override
    public void keyTyped(KeyEvent e) {}

    @Override
    public void keyPressed(KeyEvent e) {

        if (e.getKeyCode() == KeyEvent.VK_UP) {
            rotSide = true;
            rotDir = true;
        }

        if (e.getKeyCode() == KeyEvent.VK_DOWN) {
            rotSide = true;
            rotDir = false;
        }

        if (e.getKeyCode() == KeyEvent.VK_RIGHT) {
            rotSide = false;
            rotDir = true;
        }

        if (e.getKeyCode() == KeyEvent.VK_LEFT) {
            rotSide = false;
            rotDir = false;
        }

        if (e.getKeyCode() == KeyEvent.VK_SPACE) {
            if(getAnimator().isPaused()) {
                getAnimator().resume();
            } else {
                getAnimator().pause();
            }
        }
    }

    @Override
    public void keyReleased(KeyEvent e) {}

    @Override
    public void mouseClicked(MouseEvent e) {

    }

    @Override
    public void mousePressed(MouseEvent e) {

    }

    @Override
    public void mouseReleased(MouseEvent e) {

    }

    @Override
    public void mouseEntered(MouseEvent e) {

    }

    @Override
    public void mouseExited(MouseEvent e) {

    }
}
