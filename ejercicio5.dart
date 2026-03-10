// El Futuro de la IA (Gemini vs. Apple Intelligence)
// Fuentes: Google I/O 2025 & Apple WWDC 2025
// - Gemini Nano: integrado on-device en Pixel 9 y Samsung Galaxy S25
// - Gemini Pro/Ultra: disponible vía nube en todos los dispositivos Android
// - Apple Intelligence: on-device en iPhone 16 / M-series, requiere iOS 18+
// - Siri con ChatGPT integration: delegación a GPT-4o para consultas complejas
// - Gemini lidera en: traducción en vivo, generación de contenido, resumen web
// - Apple Intelligence lidera en: privacidad on-device, integración nativa con apps

// Mapa de capacidades por asistente (fuente: Google I/O & WWDC 2025)
final Map<String, List<String>> capacidadesAsistentes = {
  'Gemini (Android)': [
    'Traducción en vivo',
    'Generación de contenido',
    'Resumen de web',
    'Análisis de imágenes',
    'Código asistido',
    'Integración con Google Workspace',
    'Búsqueda multimodal',
    'Respuestas en tiempo real',
  ],
  'Siri / Apple Intelligence': [
    'Generación de contenido',
    'Resumen de notificaciones',
    'Análisis de imágenes',
    'Integración con apps nativas',
    'Procesamiento on-device',
    'Reescritura de texto',
    'Respuestas en tiempo real',
  ],
};

// 4. Función que devuelve un reporte comparativo final
Map<String, dynamic> generarReporte(
  List<String> capacidadesRequeridas,
  Map<String, List<String>> asistentes,
) {
  Map<String, dynamic> reporte = {};

  for (var entry in asistentes.entries) {
    String             nombre      = entry.key;
    List<String>       disponibles = entry.value;
    List<String>       cubiertas   = [];
    List<String>       faltantes   = [];

    // 3. Ciclo con contains para verificar cada capacidad requerida
    for (String capacidad in capacidadesRequeridas) {
      if (disponibles.contains(capacidad)) {
        cubiertas.add(capacidad);
      } else {
        faltantes.add(capacidad);
      }
    }

    double cobertura = (cubiertas.length / capacidadesRequeridas.length) * 100;

    reporte[nombre] = {
      'cubiertas': cubiertas,
      'faltantes': faltantes,
      'cobertura': cobertura,
    };
  }

  return reporte;
}

void imprimirReporte(
  List<String> capacidadesRequeridas,
  Map<String, dynamic> reporte,
) {
  print('=== Capacidades requeridas por el desarrollador ===');
  capacidadesRequeridas.forEach((c) => print('  • $c'));
  print('');

  print('=== Reporte Comparativo: Gemini vs. Apple Intelligence ===\n');

  String lider        = '';
  double maxCobertura = -1;

  reporte.forEach((asistente, datos) {
    List<String> cubiertas = List<String>.from(datos['cubiertas']);
    List<String> faltantes = List<String>.from(datos['faltantes']);
    double       cobertura = datos['cobertura'];

    print('Asistente  : $asistente');
    print('Cobertura  : ${cobertura.toStringAsFixed(0)}% '
        '(${cubiertas.length}/${capacidadesRequeridas.length} capacidades)');

    if (cubiertas.isNotEmpty) {
      print('✔ Soporta  : ${cubiertas.join(', ')}');
    }
    if (faltantes.isNotEmpty) {
      print('✖ Carece de: ${faltantes.join(', ')}');
    }

    if (cobertura > maxCobertura) {
      maxCobertura = cobertura;
      lider        = asistente;
    }

    print('');
  });

  print('══════════════════════════════════════\n');
  print('=== Conclusión ===\n');
  print('Asistente recomendado : $lider');
  print('Cobertura alcanzada   : ${maxCobertura.toStringAsFixed(0)}%\n');

  // Justificaciones contextuales por ganador
  Map<String, String> justificaciones = {
    'Gemini (Android)':
        'Gemini lidera en versatilidad: Gemini Nano corre on-device en Pixel 9 y '
        'Galaxy S25, con acceso a Gemini Pro/Ultra vía nube para tareas complejas. '
        'Ideal para desarrolladores que necesitan traducción en vivo, generación de '
        'contenido y búsqueda multimodal en un ecosistema abierto.',
    'Siri / Apple Intelligence':
        'Apple Intelligence lidera en privacidad: procesamiento on-device sin enviar '
        'datos a la nube. Ideal para entornos donde la confidencialidad es crítica, '
        'con integración profunda en apps nativas de iOS/macOS.',
  };

  print(justificaciones[lider] ?? 'Sin justificación disponible.');
  print('');
  print('Nota: para capacidades no cubiertas, Siri delega a ChatGPT-4o y '
      'Gemini escala a modelos Pro/Ultra en la nube automáticamente.');
}

void main() {
  // 1. Lista de capacidades requeridas por el desarrollador
  List<String> capacidadesRequeridas = [
    'Traducción en vivo',
    'Generación de contenido',
    'Resumen de web',
    'Análisis de imágenes',
    'Código asistido',
  ];

  // 2. Mapa Siri/Gemini con capacidades (definido arriba como capacidadesAsistentes)

  // Generar y mostrar reporte
  Map<String, dynamic> reporte = generarReporte(
    capacidadesRequeridas,
    capacidadesAsistentes,
  );

  imprimirReporte(capacidadesRequeridas, reporte);
}
