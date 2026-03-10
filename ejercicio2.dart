// El Filtro de la Fragmentación (Adopción de OS)
// Fuentes: StatCounter & Google / Apple (2025)
// - Adopción Android 15 (versión más reciente): ~18% de dispositivos Android activos
// - Adopción iOS 18     (versión más reciente): ~72% de dispositivos iOS activos
// Contexto: Android sufre alta fragmentación; iOS concentra actualizaciones rápidamente.

void filtrarAdopcion(
  List<Map<String, dynamic>> versiones,
  double umbralCritico,
  Map<String, String> estrategias,
) {
  print('=== Análisis de Adopción de OS ===');
  print('Umbral Crítico: ${umbralCritico.toStringAsFixed(0)}%\n');

  List<String> plataformasBajoUmbral = [];

  for (var version in versiones) {
    String plataforma = version['plataforma'];
    double adopcion = version['adopcion'];
    String estado = adopcion >= umbralCritico ? 'OK' : 'BAJO UMBRAL';

    print('$plataforma: ${adopcion.toStringAsFixed(0)}% — $estado');

    if (adopcion < umbralCritico) {
      plataformasBajoUmbral.add(plataforma);
    }
  }

  print('');

  if (plataformasBajoUmbral.isEmpty) {
    print('Conclusión: Todas las plataformas superan el umbral. Sin riesgos de fragmentación.');
    return;
  }

  print('=== Estrategias de Retrocompatibilidad ===');
  for (var plataforma in plataformasBajoUmbral) {
    String estrategia = estrategias[plataforma] ?? 'Sin estrategia definida';
    print('$plataforma → $estrategia');
  }
}

void main() {
  // 1. Lista con porcentajes de adopción de las versiones más recientes
  List<Map<String, dynamic>> versiones = [
    {'plataforma': 'Android 15', 'adopcion': 18.0},
    {'plataforma': 'iOS 18',     'adopcion': 72.0},
  ];

  // 2. Variable de Umbral Crítico
  double umbralCritico = 50.0;

  // 4. Mapa de Estrategias de Retrocompatibilidad
  Map<String, String> estrategias = {
    'Android 15': 'Soportar Android 10+ con minSdkVersion 29; usar Jetpack para APIs modernas via compat libs.',
    'iOS 18':     'Soportar iOS 16+ con @available guards; limitar features de IA a dispositivos con iOS 18.',
  };

  print('--- Datos de entrada ---');
  for (var v in versiones) {
    print('${v['plataforma']}: ${v['adopcion'].toStringAsFixed(0)}% de adopción');
  }
  print('');

  // 3. Función con ciclo y condicionales que filtra versiones bajo el umbral
  filtrarAdopcion(versiones, umbralCritico, estrategias);
}
