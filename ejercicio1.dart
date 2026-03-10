// El Dilema de la Monetización (ROI)
// Fuentes: Sensor Tower & data.ai (2025)
// - Gasto mensual promedio iOS:     ~$33 USD/usuario
// - Gasto mensual promedio Android: ~$9  USD/usuario
// - Recaudación total App Store 2025:    ~$89,000 millones USD
// - Recaudación total Google Play 2025:  ~$47,000 millones USD

void analizarRentabilidad(List<Map<String, dynamic>> plataformas) {
  Map<String, String> recomendacionFinal = {};
  String mejorPlataforma = '';
  double mayorGasto = 0;

  for (var plataforma in plataformas) {
    String nombre = plataforma['nombre'];
    double gasto = plataforma['gastoPromedio'];

    if (gasto > 10) {
      recomendacionFinal[nombre] = 'Alta Rentabilidad';
    } else {
      recomendacionFinal[nombre] = 'Baja Rentabilidad';
    }

    if (gasto > mayorGasto) {
      mayorGasto = gasto;
      mejorPlataforma = nombre;
    }
  }

  print('=== Recomendación Final ===');
  recomendacionFinal.forEach((plataforma, recomendacion) {
    print('$plataforma: $recomendacion');
  });

  print('');
  List<String> altaRentabilidad = recomendacionFinal.entries
      .where((e) => e.value == 'Alta Rentabilidad')
      .map((e) => e.key)
      .toList();

  if (altaRentabilidad.isEmpty) {
    print('Conclusión: Ninguna plataforma supera el umbral de Alta Rentabilidad.');
    print('Recomendación: revisar el modelo de negocio antes de invertir.');
  } else if (altaRentabilidad.length == recomendacionFinal.length) {
    print('Conclusión: Todas las plataformas son de Alta Rentabilidad.');
    print('Recomendación: priorizar "$mejorPlataforma" (\$$mayorGasto/mes) por mayor gasto promedio.');
  } else {
    print('Conclusión: "$mejorPlataforma" lidera con \$$mayorGasto USD/mes por usuario.');
    print('Recomendación: priorizar "$mejorPlataforma" para maximizar el Return on Investments inicial.');
  }
}

void main() {
  List<Map<String, dynamic>> plataformas = [
    {'nombre': 'iOS (App Store)', 'gastoPromedio': 33.0},
    {'nombre': 'Android (Google Play)', 'gastoPromedio': 9.0},
  ];

  analizarRentabilidad(plataformas);
}
