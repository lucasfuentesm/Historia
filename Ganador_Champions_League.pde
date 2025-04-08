Jugador jugador;
int goles = 0;
String estado = "inicio";  // puede ser "inicio", "jugando", "climax", "final"

void setup() {
  size(800, 600);
  jugador = new Jugador(width/2, height - 100);
}

void draw() {
  background(0, 120, 0); // Verde césped

  if (estado.equals("inicio")) {
    mostrarInicio();
  } else if (estado.equals("jugando")) {
    mostrarPartido();
  } else if (estado.equals("climax")) {
    mostrarClimax();
  } else if (estado.equals("final")) {
    mostrarFinal();
  }
}

void mostrarInicio() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(32);
  text("Final de la Champions League", width/2, height/2 - 40);
  text("Presiona 'I' para comenzar", width/2, height/2 + 20);
}

void mostrarPartido() {
  jugador.mostrar();
  fill(255);
  textSize(24);
  text("Haz clic para que el jugador dispare", width/2, 50);
  text("Goles: " + goles, width - 120, 50);
}

void mostrarClimax() {
  jugador.mostrar();
  fill(255, 255, 0);
  textAlign(CENTER);
  textSize(40);
  text("¡HAT-TRICK! ¡Eres leyenda!", width/2, height/2);
  textSize(20);
  text("Presiona 'F' para celebrar", width/2, height/2 + 40);
}

void mostrarFinal() {
  background(0, 0, 120);
  fill(255);
  textAlign(CENTER);
  textSize(32);
  text("¡Victoria!", width/2, height/2 - 40);
  text("¡Has ganado la Champions!", width/2, height/2);
  textSize(20);
  text("El jugador levanta la copa.", width/2, height/2 + 40);
}

// Eventos de interacción

void keyPressed() {
  if (key == 'I' || key == 'i') {
    estado = "jugando";
  }

  if ((key == 'F' || key == 'f') && goles == 3) {
    estado = "final";
  }
}

void mousePressed() {
  if (estado.equals("jugando")) {
    goles++;
    jugador.anotar();
    if (goles == 3) {
      estado = "climax";
    }
  }
}

// Clase Jugador

class Jugador {
  float x, y;
  color col;

  Jugador(float x, float y) {
    this.x = x;
    this.y = y;
    this.col = color(255, 0, 0);
  }

  void mostrar() {
    fill(col);
    ellipse(x, y, 80, 80); // Cabeza
    rect(x - 20, y, 40, 60); // Cuerpo
  }

  void anotar() {
    col = color(random(255), random(255), random(255)); // Cambia de color al anotar
  }
}
