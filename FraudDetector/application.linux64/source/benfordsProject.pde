PImage toProcess;
PrintWriter output;

void setup(){
  System.setProperty("java.awt.headless", "true");
  //size(2000, 2000);
  output = createWriter("output.txt");
  //toProcess = loadImage("rorySelfie.jpg");
  //toProcess = loadImage("stillmatic.jpeg");
  //toProcess = loadImage("Gull_portrait_ca_usa.jpg");
  toProcess = loadImage("image.jpeg");
  //proofOfConcept();
  bedfords();
}


void bedfords() {
  float[] count = new float[11];
  int r = 0, g = 0, b = 0, total = 0;
  for (int i = 0; i < toProcess.width; i++) {
    for (int j = 0; j < toProcess.height; j++) {
      r = (int)red(toProcess.get(i, j));
      g = (int)green(toProcess.get(i, j));
      b = (int)blue(toProcess.get(i, j));
      count[Integer.parseInt(Integer.toString(r).substring(0, 1))]++;
      count[Integer.parseInt(Integer.toString(g).substring(0, 1))]++;
      count[Integer.parseInt(Integer.toString(b).substring(0, 1))]++;
      total += 3;
    }
  }
  println("Total number of RGB values:", total);
  for (int k = 0; k < count.length - 1; k++) {
     println("Count of", k, ":", count[k]);
     println("Percentage of occurances of", k, ":", (count[k]/total)*100);
  }
  output(count);
}

void output(float[] arr) {
   for (int i = 0; i < arr.length - 1; i++) {
     output.println(arr[i]); 
   }
   output.flush();
   output.close();
   exit();
}

void proofOfConcept() {
  //println(red(toProcess.get(0, 0))); 
  for (int i = 0; i < toProcess.width; i++) {
    for (int j = 0; j < toProcess.height; j++) {
       println("The red value at pixel", i, ",", j, "is", red(toProcess.get(i, j)));
       println("The green value at pixel", i, ",", j, "is", green(toProcess.get(i, j)));
       println("The blue value at pixel", i, ",", j, "is", blue(toProcess.get(i, j)));
    }
    
  }
}
