// Personalización vs. Estabilidad
// Fuentes: Android Authority & Apple Insider (2025)
// - Android: root, launchers alternativos, sideloading nativo, alta personalización
// - iOS:     crash rate ~0.1%, sin lags en hardware propio, ecosistema cerrado y estable
// - Android crash rate promedio: ~0.4% (varía por fabricante y versión de OS)

// Plataformas disponibles con sus atributos calificados (escala 0–10)
final List<Map<String, dynamic>> plataformas = [
  {
    'nombre': 'Android',
    'atributos': {
      'Customización':  10,
      'Sideloading':    10,
      'Root':           10,
      'Estabilidad':     6,
      'Sin lags':        6,
      'Sin crashes':     6,
    },
  },
  {
    'nombre': 'iOS',
    'atributos': {
      'Customización':   4,
      'Sideloading':     3,
      'Root':            0,
      'Estabilidad':    10,
      'Sin lags':       10,
      'Sin crashes':    10,
    },
  },
];

// 3. Función que recibe el perfil, recorre los atributos y hace el match
Map<String, dynamic> matchPerfil(
  Map<String, dynamic> perfil,
  List<Map<String, dynamic>> plataformas,
) {
  String nombrePerfil   = perfil['nombre'];
  List<String> prioridades = List<String>.from(perfil['prioridades']);

  print('--- Perfil: $nombrePerfil ---');
  print('Prioridades: ${prioridades.join(', ')}\n');

  Map<String, int> puntajes = {};

  for (var plataforma in plataformas) {
    String nombrePlat = plataforma['nombre'];
    Map<String, int> atributos = Map<String, int>.from(plataforma['atributos']);
    int puntajeTotal = 0;

    // Ciclo sobre la lista de atributos del perfil con condicional de match
    for (String prioridad in prioridades) {
      if (atributos.containsKey(prioridad)) {
        int valor = atributos[prioridad]!;
        puntajeTotal += valor;
        print('  $nombrePlat | $prioridad: $valor/10');
      } else {
        print('  $nombrePlat | $prioridad: atributo no definido');
      }
    }

    puntajes[nombrePlat] = puntajeTotal;
    print('  → Puntaje total $nombrePlat: $puntajeTotal\n');
  }

  // Determinar la plataforma ganadora
  String ganadora = '';
  int maxPuntaje = -1;
  puntajes.forEach((plat, pts) {
    if (pts > maxPuntaje) {
      maxPuntaje = pts;
      ganadora   = plat;
    }
  });

  return {'perfil': nombrePerfil, 'plataforma': ganadora, 'puntaje': maxPuntaje};
}

void imprimirRecomendacion(Map<String, dynamic> resultado) {
  String perfil     = resultado['perfil'];
  String plataforma = resultado['plataforma'];
  int    puntaje    = resultado['puntaje'];

  // Mapa de justificaciones detalladas por combinación perfil–plataforma
  Map<String, String> justificaciones = {
    'Hardcore–Android':
        'Android ofrece root nativo, launchers ilimitados y sideloading sin restricciones. '
        'Control total sobre el sistema operativo.',
    'Hardcore–iOS':
        'iOS limita severamente la personalización. No recomendado para usuarios Hardcore.',
    'Ejecutivo–iOS':
        'iOS garantiza crash rate <0.1%, actualizaciones simultáneas y rendimiento '
        'optimizado en hardware propio. Cero distracciones.',
    'Ejecutivo–Android':
        'Android es estable en flagships, pero la fragmentación puede introducir '
        'inconsistencias. Aceptable con dispositivos Pixel o Samsung Galaxy S.',
  };

  String clave        = '$perfil–$plataforma';
  String descripcion  = justificaciones[clave] ?? 'Sin justificación disponible.';

  print('=== Recomendación para perfil "$perfil" ===');
  print('Plataforma ideal: $plataforma (puntaje: $puntaje)');
  print('Justificación: $descripcion\n');
}

void main() {
  // 1. Mapa de Perfiles de Usuario con sus preferencias
  List<Map<String, dynamic>> perfiles = [
    {
      'nombre':     'Hardcore',
      'prioridades': ['Customización', 'Sideloading', 'Root'],
    },
    {
      'nombre':     'Ejecutivo',
      'prioridades': ['Estabilidad', 'Sin lags', 'Sin crashes'],
    },
  ];

  // 2. Lista de Atributos de Plataforma (definidos dentro de cada plataforma arriba)
  List<String> atributosDisponibles = [
    'Customización', 'Sideloading', 'Root',
    'Estabilidad', 'Sin lags', 'Sin crashes',
  ];

  print('Atributos evaluados: ${atributosDisponibles.join(', ')}\n');

  List<Map<String, dynamic>> resultados = [];

  for (var perfil in perfiles) {
    var resultado = matchPerfil(perfil, plataformas);
    resultados.add(resultado);
  }

  print('══════════════════════════════════════\n');

  // 4. Imprimir recomendación detallada
  for (var resultado in resultados) {
    imprimirRecomendacion(resultado);
  }
}
