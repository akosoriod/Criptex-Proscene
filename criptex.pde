import remixlab.proscene.*;
import remixlab.dandelion.geom.*;
import remixlab.dandelion.constraint.*;
Scene scene;
InteractiveFrame dl1f,dl2f,dl3f,dl4f,dl5f,dl6f,dl7f,dl8f,baf,bbf;
PShape letters_disk_1;
PShape letters_disk_2;
PShape letters_disk_3;
PShape letters_disk_4;
PShape letters_disk_5;
PShape letters_disk_6;
PShape letters_disk_7;
PShape letters_disk_8;
PShape base_a;
PShape base_b;

float ry;

PShader texlightShader;

//Test
boolean activeBaseBTranslationContrain = true;

//Constrains
LocalConstraint baseBConstrain;
LocalConstraint letterDiskConstrain;

public void setup() {
  size(960, 640, P3D);
  
  //Load light/texture pixel shaders
  texlightShader = loadShader("pixlightxfrag.glsl", "pixlightxvert.glsl");
  
  //load criptex parts
  letters_disk_1 = loadShape("letters_disk.obj");
  letters_disk_2 = loadShape("letters_disk.obj");
  letters_disk_3 = loadShape("letters_disk.obj");
  letters_disk_4 = loadShape("letters_disk.obj");
  letters_disk_5 = loadShape("letters_disk.obj");
  letters_disk_6 = loadShape("letters_disk.obj");
  letters_disk_7 = loadShape("letters_disk.obj");
  letters_disk_8 = loadShape("letters_disk.obj");
  base_a = loadShape("base_a.obj");
  base_b = loadShape("base_b.obj");
  
  //define scene
  scene = new Scene(this);
  scene.setGridVisualHint(false);
  scene.setAxesVisualHint(false);
  //define constrains for letters disk's and base
  letterDiskConstrain = new LocalConstraint();
  letterDiskConstrain.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new Vec(0.0f, 0.0f, 0.0f));
  letterDiskConstrain.setRotationConstraint(AxisPlaneConstraint.Type.AXIS, new Vec(0.0f, 0.0f, 1.0f));
  
  baseBConstrain = new LocalConstraint();
  baseBConstrain.setTranslationConstraint(AxisPlaneConstraint.Type.AXIS, new Vec(0.0f, 0.0f, 1.0f));
  baseBConstrain.setRotationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new Vec(0.0f, 0.0f, 0.0f));  
  
  //frames initialization and asign position
  baf = new InteractiveFrame(scene);
  baf.rotate(new Quat(new Vec(0, 0, 1), PI));
  baf.scale(0.14);
  
  dl1f = new InteractiveFrame(scene,baf);
  dl1f.rotate(new Quat(new Vec(1, 0, 0), PI/2));
  dl1f.translate(0, 71, 0);
  dl1f.startSpinning(new Quat(new Vec(0, 0, 1), getRandomLetter()), 1, 20);  
  dl1f.setConstraint(letterDiskConstrain);
  
  dl2f = new InteractiveFrame(scene,baf);
  dl2f.rotate(new Quat(new Vec(1, 0, 0), PI/2));
  dl2f.translate(0, 142, 0);
  dl2f.startSpinning(new Quat(new Vec(0, 0, 1), getRandomLetter()), 1, 20);  
  dl2f.setConstraint(letterDiskConstrain);
  
  dl3f = new InteractiveFrame(scene,baf);
  dl3f.rotate(new Quat(new Vec(1, 0, 0), PI/2));
  dl3f.translate(0, 213, 0);
  dl3f.startSpinning(new Quat(new Vec(0, 0, 1), getRandomLetter()), 1, 20);  
  dl3f.setConstraint(letterDiskConstrain);
  
  dl4f = new InteractiveFrame(scene,baf);
  dl4f.rotate(new Quat(new Vec(1, 0, 0), PI/2));
  dl4f.translate(0, 284, 0);
  dl4f.startSpinning(new Quat(new Vec(0, 0, 1), getRandomLetter()), 1, 20);  
  dl4f.setConstraint(letterDiskConstrain);
  
  
  dl5f = new InteractiveFrame(scene,baf);
  dl5f.rotate(new Quat(new Vec(1, 0, 0), PI/2));
  dl5f.translate(0, 355, 0);
  dl5f.startSpinning(new Quat(new Vec(0, 0, 1), getRandomLetter()), 1, 20);  
  dl5f.setConstraint(letterDiskConstrain);
  
  dl6f = new InteractiveFrame(scene,baf);
  dl6f.rotate(new Quat(new Vec(1, 0, 0), PI/2));
  dl6f.translate(0, 426, 0);
  dl6f.startSpinning(new Quat(new Vec(0, 0, 1), getRandomLetter()), 1, 20);  
  dl6f.setConstraint(letterDiskConstrain);
  
  dl7f = new InteractiveFrame(scene,baf);
  dl7f.rotate(new Quat(new Vec(1, 0, 0), PI/2));
  dl7f.translate(0, 497, 0);
  dl7f.startSpinning(new Quat(new Vec(0, 0, 1), getRandomLetter()), 1, 20);  
  dl7f.setConstraint(letterDiskConstrain);
  
  dl8f = new InteractiveFrame(scene,baf);
  dl8f.rotate(new Quat(new Vec(1, 0, 0), PI/2));
  dl8f.translate(0, 568, 0);
  dl8f.startSpinning(new Quat(new Vec(0, 0, 1), getRandomLetter()), 1, 20);  
  dl8f.setConstraint(letterDiskConstrain);
  
  bbf = new InteractiveFrame(scene,baf);
  bbf.rotate(new Quat(new Vec(1, 0, 0), PI/2));
  bbf.rotate(new Quat(new Vec(0, 0, 1), PI));
  bbf.translate(0, 594, 0);
  bbf.setConstraint(baseBConstrain);
  
  //Set shapes for every frame
  dl1f.setShape(letters_disk_1);
  dl2f.setShape(letters_disk_2);
  dl3f.setShape(letters_disk_3);
  dl4f.setShape(letters_disk_4);
  dl5f.setShape(letters_disk_5);
  dl6f.setShape(letters_disk_6);
  dl7f.setShape(letters_disk_7);
  dl8f.setShape(letters_disk_8);
  baf.setShape(base_a);
  bbf.setShape(base_b);
  
  for (InteractiveFrame iFrame : scene.frames()) {
    //Overwrite mouse event wheel from scale to rotate
    if(!iFrame.isEyeFrame()){
      iFrame.setMotionBinding(MouseAgent.WHEEL_ID, "rotate");
    }
    iFrame.setMotionBinding(CENTER, "rotate");
    if(iFrame.equals(baf) || iFrame.equals(bbf)){
      //Disable frame highlighting for base's frames
      iFrame.setHighlightingMode(InteractiveFrame.HighlightingMode.NONE);
    }
    else{
      //Attach custom click handler for letters disk, needs review
      //iFrame.setClickBinding(LEFT, 1, "nextLetter");
    }
  }
  scene.camera().setPosition(new Vec(0,-48, 150));
  scene.camera().setOrientation(new Quat(0, 0, sin(PI/4), cos(PI/4)));
}

public void draw() {
  background(0);
  shader(texlightShader);  
  
  scene.drawFrames();
  scene.applyTransformation(baf);
  scene.applyTransformation(dl1f);
  scene.applyTransformation(dl2f);
  scene.applyTransformation(dl3f);
  scene.applyTransformation(dl4f);
  scene.applyTransformation(dl5f);
  scene.applyTransformation(dl6f);
  scene.applyTransformation(dl7f);
  scene.applyTransformation(dl8f);
    if ((dl1f.xAxis().x()>-0.61075413 && dl1f.xAxis().x()<-0.40568537)&&(dl2f.xAxis().x()>-0.5073381 
          && dl2f.xAxis().x()<-0.29334962)&&(dl3f.xAxis().x()>-0.6078026 && dl3f.xAxis().x()<-0.40972626)
          && (dl4f.xAxis().x()>-0.17233637 && dl4f.xAxis().x()<0.058465004 ) && (dl5f.xAxis().x()>0.6248534 
          && dl5f.xAxis().x()<0.798388) && (dl6f.xAxis().x()>-0.28813246  && dl6f.xAxis().x()<-0.05530393) 
          && (dl7f.xAxis().x()>0.4314683  && dl7f.xAxis().x()<0.61716706)&&(dl8f.xAxis().x()>-0.02760317  
          && dl8f.xAxis().x()<0.174152)){    

    activeBaseBTranslationContrain = false; 
  } else{
    activeBaseBTranslationContrain = true; 
  }
  //Simulate criptex lock/unlock
  if(activeBaseBTranslationContrain){
    baseBConstrain.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new Vec(0.0f, 0.0f, 0.0f));
  }
  else{
    baseBConstrain.setTranslationConstraint(AxisPlaneConstraint.Type.AXIS, new Vec(0.0f, 0.0f, 1.0f));
  }
}

void keyPressed() {
  if (key == ' '){    

  print("Dis1:");
    print((dl1f.xAxis().x()>-0.61075413 && dl1f.xAxis().x()<-0.40568537));
    print("Dis2:");
    print((dl2f.xAxis().x()>-0.5073381 && dl2f.xAxis().x()<-0.29334962));
     print("Dis3:");
    print((dl3f.xAxis().x()>-0.6078026 && dl3f.xAxis().x()<-0.40972626));
     print("Dis4:");
    print((dl4f.xAxis().x()>-0.17233637 && dl4f.xAxis().x()<0.058465004 ));
      print("Dis5:");
    print((dl5f.xAxis().x()>0.6248534 && dl5f.xAxis().x()<0.798388));
     print("Dis6:");
    print((dl6f.xAxis().x()>-0.28813246  && dl6f.xAxis().x()<-0.05530393));
     print("Dis7:");
    print((dl7f.xAxis().x()>0.4314683  && dl7f.xAxis().x()<0.61716706));
     print("Dis8:");
    print((dl8f.xAxis().x()>-0.02760317  && dl8f.xAxis().x()<0.174152));
  } 
}

void nextLetter(InteractiveFrame iFrame) {
  float currentRotation = iFrame.xAxis().x();
  float deltaRotation = ((PI/26)/4);
  iFrame.rotate(new Quat(new Vec(0, 0, 1), currentRotation + deltaRotation));
  print("new position: "+ (currentRotation + deltaRotation));
}

float getRandomLetter(){
  int position = (int)random(1, 26);
  return ((PI/26)/4)*position - 0.005;
}