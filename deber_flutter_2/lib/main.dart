import 'escuela.dart'; // Importamos la clase Escuela

void main() {
  Escuela escuela = Escuela();

  // Añadir estudiantes
  escuela.agregarEstudiante(
      "Juan", {"Matemáticas": 90, "Historia": 85, "Ciencias": 92});

  escuela.agregarEstudiante(
      "Maria", {"Matemáticas": 95, "Historia": 75, "Ciencias": 85});

  // Calcular promedio de un estudiante
  double promedioJuan = escuela.calcularPromedio("Juan");
  print("El promedio de Juan es: $promedioJuan");

  // Calificaciones más alta y más baja
  double maxMatematicas = escuela.calificacionMasAlta("Matemáticas");
  double minHistoria = escuela.calificacionMasBaja("Historia");

  print("La calificación más alta en Matemáticas es: $maxMatematicas");
  print("La calificación más baja en Historia es: $minHistoria");
}
