import 'estudiante.dart'; // Importamos la clase Estudiante

class Escuela {
  List<Estudiante> estudiantes = [];

  void agregarEstudiante(String nombre, Map<String, double> calificaciones) {
    estudiantes.add(Estudiante(nombre, calificaciones));
    print("Estudiante $nombre añadido.");
  }

  double calcularPromedio(String nombre) {
    Estudiante? estudiante = estudiantes.firstWhere(
        (est) => est.nombre == nombre,
        orElse: () =>
            Estudiante("No encontrado", {})); // Retorna un Estudiante vacío

    if (estudiante.nombre == "No encontrado") {
      print("Estudiante no encontrado.");
      return 0; // O cualquier valor que desees retornar
    }

    double suma = estudiante.calificaciones.values.reduce((a, b) => a + b);
    return suma / estudiante.calificaciones.length;
  }

  double calificacionMasAlta(String asignatura) {
    double max = estudiantes
        .map((est) => est.calificaciones[asignatura] ?? 0)
        .reduce((a, b) => a > b ? a : b);
    return max;
  }

  double calificacionMasBaja(String asignatura) {
    double min = estudiantes
        .map((est) => est.calificaciones[asignatura] ?? 0)
        .reduce((a, b) => a < b ? a : b);
    return min;
  }
}
