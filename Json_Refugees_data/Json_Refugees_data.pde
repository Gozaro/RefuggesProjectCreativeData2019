JSONObject json1, json2;
String url1 = "https://data2.unhcr.org/api/population/get?widget_id=132313&sv_id=11&population_group=4797%2C4798&year=latest";
String url2 = "https://data2.unhcr.org/api/population/get?widget_id=132316&sv_id=11&population_group=4801";


int tmp;
int value1, value2;
int valorAleX1, valorAleY1;

int resolucionW = 1366;
int resolucionH = 768;

void setup() {
  
  size(1366, 768);
  
 
  
  // Numero total de personas que llegan
  json1 = loadJSONObject(url1);
  json2 = loadJSONObject(url2);
  
  
  JSONArray data1 = json1.getJSONArray("data");
  JSONObject individuals1 = data1.getJSONObject(0); 
  value1 = individuals1.getInt("individuals");
  
 
  // Numero de muertes o desaparecidos
  
  JSONArray data2 = json2.getJSONArray("data");
  JSONObject individuals2 = data2.getJSONObject(0); 
  value2 = individuals2.getInt("individuals");
  
  println(value1);
  println("////////////");
  
  GenerateMap1();
  GenerateMap2();
  
}

// total llegadas
void GenerateMap1() {

  for (int i =0; i< value1; i++) {
    
      tmp = i;
      //println(tmp);
     
      valorAleX1 = int(random(0,resolucionW));
      valorAleY1 = int(random(0,resolucionH));
      
      
      stroke(255,255,255);
      fill(0,0,0);
      
      
      int sizeItem2 = int(random(5,10));
      ellipse(valorAleX1,valorAleY1,sizeItem2,sizeItem2);
    
    
  }
    
}

// muertos  desaparecidos
void GenerateMap2() {

  for (int i =0; i< value2; i++) {
    
      tmp = i;
      //println(tmp);
     
      valorAleX1 = int(random(0,resolucionW));
      valorAleY1 = int(random(0,resolucionH));
      
      //pushMatrix();
      stroke(0,0,0);
      fill(255,30,30);
      //popMatrix();
      
      int sizeItem2 = int(random(5,20));
      ellipse(valorAleX1,valorAleY1,sizeItem2,sizeItem2);
    
    
  }
    
}

void draw() {}

// salvar imagen cada vez diferente
void mousePressed() {
  
  int d = day();    // Values from 1 - 31
  int mo = month();  // Values from 1 - 12
  int y = year();
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  
   save("grafico"+d+mo+y+h+m+s+".png");
   println("grafico"+d+mo+y+h+m+s+".png");
}

void keyPressed() {
  println("keyPressed");
}
