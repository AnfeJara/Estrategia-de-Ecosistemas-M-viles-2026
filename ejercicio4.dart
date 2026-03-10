// Auditoría de Seguridad y Ecosistema
// Fuentes: Verizon DBIR 2025 & IBM X-Force Threat Intelligence Index 2025
// - iOS: sistema cerrado, App Store revisión manual, 0 sideloading por defecto
// - Android (stock): sideloading habilitado, Google Play Protect activo
// - Android (Enterprise/MDM): sideloading bloqueado por política, apto para empresas
// - HarmonyOS: ecosistema semi-cerrado, tiendas de terceros disponibles en China
// - 99% del malware móvil proviene de tiendas de terceros (fuera de stores oficiales)

// 2. Función que analiza cada plataforma con ciclo y condicional complejo
List<Map<String, dynamic>> auditarPlataformas(
  List<Map<String, dynamic>> plataformas,
) {
  List<Map<String, dynamic>> aprobadas = [];

  print('=== Auditoría de Plataformas ===\n');

  for (var plataforma in plataformas) {
    String nombre          = plataforma['nombre'];
    bool   esCerrado       = plataforma['esCerrado'];
    bool   tiendasTerceros = plataforma['tiendasTerceros'];

    String estadoCerrado   = esCerrado       ? 'Cerrado'           : 'Abierto';
    String estadoTiendas   = tiendasTerceros ? 'Con tiendas 3ros'  : 'Sin tiendas 3ros';
    String riesgo          = tiendasTerceros ? '⚠ RIESGO ALTO'     : 'Riesgo bajo';

    print('Plataforma : $nombre');
    print('Ecosistema : $estadoCerrado');
    print('Tiendas    : $estadoTiendas');
    print('Evaluación : $riesgo');

    // 3. Condicional complejo: cerrado Y sin tiendas de terceros → aprobado
    if (esCerrado && !tiendasTerceros) {
      plataforma['veredicto'] = 'APROBADO';
      aprobadas.add(plataforma);
      print('Veredicto  : ✔ APROBADO para entorno empresarial');
    } else {
      plataforma['veredicto'] = 'RECHAZADO';
      String motivo = !esCerrado && tiendasTerceros
          ? 'ecosistema abierto + tiendas de terceros'
          : !esCerrado
              ? 'ecosistema abierto'
              : 'permite tiendas de terceros';
      print('Veredicto  : ✖ RECHAZADO ($motivo)');
    }

    print('');
  }

  return aprobadas;
}

void main() {
  // 1. Lista de mapas con esCerrado (bool) y tiendasTerceros (bool)
  List<Map<String, dynamic>> plataformas = [
    {
      'nombre':          'iOS 18',
      'esCerrado':       true,
      'tiendasTerceros': false,
      'notas':           'App Store con revisión manual; sin sideloading nativo en versión estándar',
    },
    {
      'nombre':          'Android 15 (stock)',
      'esCerrado':       false,
      'tiendasTerceros': true,
      'notas':           'Sideloading activo por defecto; Google Play Protect no bloquea APKs externos',
    },
    {
      'nombre':          'Android Enterprise (MDM)',
      'esCerrado':       true,
      'tiendasTerceros': false,
      'notas':           'Políticas MDM bloquean tiendas externas; solo apps corporativas aprobadas',
    },
    {
      'nombre':          'HarmonyOS 4',
      'esCerrado':       false,
      'tiendasTerceros': true,
      'notas':           'AppGallery oficial + tiendas de terceros habilitadas en mercados regionales',
    },
  ];

  List<Map<String, dynamic>> aprobadas = auditarPlataformas(plataformas);

  print('══════════════════════════════════════\n');
  print('=== Plataformas Aprobadas para Empresa Fortune 500 ===\n');

  if (aprobadas.isEmpty) {
    print('Ninguna plataforma cumple los criterios de seguridad corporativa.');
  } else {
    // 4. Mostrar lista final con forEach
    aprobadas.forEach((p) {
      print('✔ ${p['nombre']}');
      print('  Ecosistema : ${p['esCerrado'] ? "Cerrado" : "Abierto"}');
      print('  Tiendas 3ros: ${p['tiendasTerceros'] ? "Sí" : "No"}');
      print('  Notas      : ${p['notas']}');
      print('');
    });

    print('Total aprobadas: ${aprobadas.length} de ${plataformas.length} plataformas evaluadas.');
    print('Recomendación: desplegar ${aprobadas.map((p) => p['nombre']).join(' y ')} '
        'como estándar corporativo para minimizar superficie de ataque.');
  }
}
