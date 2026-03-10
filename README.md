# Ejercicios Dart — Análisis de Plataformas Móviles (iOS vs Android)
Colección de 5 ejercicios en Dart que analizan el ecosistema móvil actual usando datos reales de 2025.
Cada ejercicio aplica estructuras de datos, ciclos y condicionales para resolver un escenario de negocio distinto.

## Ejercicio 1: El Dilema de la Monetización (ROI)
Archivo: `ejercicio1.dart`
Fuentes: Sensor Tower & data.ai (2025)

### Escenario
Un cliente quiere saber en qué plataforma invertir para maximizar ingresos.

### Datos
| Plataforma | Gasto promedio/usuario | Recaudación 2025 |
|---|---|---|
| iOS (App Store) | $33 USD/mes | ~$89,000 millones USD |
| Android (Google Play) | $9 USD/mes | ~$47,000 millones USD |

### Conceptos Dart
- `List<Map<String, dynamic>>` · ciclo `for` · condicionales `if/else`
- `Map<String, String>` · `forEach` · métodos `where` y `map`

## Ejercicio 2: El Filtro de la Fragmentación (Adopción de OS)
Archivo: `ejercicio2.dart`
Fuentes: StatCounter & Google / Apple (2025)

### Escenario
Un cliente quiere lanzar una app con IA avanzada pero teme que los usuarios no tengan el OS necesario.

### Datos
| Versión | Adopción | Resultado |
|---|---|---|
| Android 15 | 18% | Bajo umbral (50%) |
| iOS 18 | 72% | OK |

### Conceptos Dart
- `List<Map>` con porcentajes · variable `double` de umbral crítico
- `Map<String, String>` de estrategias · ciclo `for` con operador ternario

## Ejercicio 3: Personalización vs. Estabilidad
Archivo: `ejercicio3.dart`
Fuentes: Android Authority & Apple Insider (2025)

### Escenario
Usuario Hardcore (root, launchers) vs usuario Ejecutivo (estabilidad, sin crashes).

### Datos — Atributos de plataforma (0–10)
| Atributo | Android | iOS |
|---|---|---|
| Customización / Sideloading / Root | 10 | 4 / 3 / 0 |
| Estabilidad / Sin lags / Sin crashes | 6 | 10 |

### Conceptos Dart
- Mapa de perfiles con prioridades · ciclo `for` anidado
- `containsKey` · acumulación de puntaje · justificaciones por combinación perfil–plataforma

## Ejercicio 4: Auditoría de Seguridad y Ecosistema
Archivo: `ejercicio4.dart`
Fuentes: Verizon DBIR 2025 & IBM X-Force Threat Intelligence Index 2025

### Escenario
Una empresa Fortune 500 necesita elegir dispositivos seguros para sus empleados.

### Datos
| Plataforma | Cerrado | Tiendas 3ros | Veredicto |
|---|---|---|---|
| iOS 18 | Sí | No | APROBADO |
| Android 15 (stock) | No | Sí | RECHAZADO |
| Android Enterprise (MDM) | Sí | No | APROBADO |
| HarmonyOS 4 | No | Sí | RECHAZADO |

> El 99% del malware móvil proviene de tiendas fuera de los stores oficiales.

### Conceptos Dart
Claves `esCerrado` y `tiendasTerceros` (bool) · condicional complejo `&&` / `!`
Ternario anidado para motivo de rechazo · `forEach` en lista de aprobadas

## Ejercicio 5: El Futuro de la IA (Gemini vs. Apple Intelligence)
Archivo: `ejercicio5.dart`
Fuentes: Google I/O 2025 & Apple WWDC 2025

### Escenario
Un desarrollador quiere saber qué asistente de voz cubre mejor sus necesidades en 2026.

### Datos — Cobertura de capacidades requeridas
| Capacidad | Gemini | Siri / Apple Intelligence |
|---|---|---|
| Traducción en vivo | Sí | No |
| Generación de contenido | Sí | Sí |
| Resumen de web | Sí | No |
| Análisis de imágenes | Sí | Sí |
| Código asistido | Sí | No |

Resultado: Gemini 100% y Siri 40%

### Conceptos Dart
`Map<String, List<String>>` de capacidades · método `contains` en ciclo
Cálculo de porcentaje de cobertura · `forEach` · justificaciones por ganador

## Cómo ejecutar cualquier ejercicio
en terminal de bash correr el comando

dart run ejercicio1.dart
dart run ejercicio2.dart
dart run ejercicio3.dart
dart run ejercicio4.dart
dart run ejercicio5.dart

## Requiere
Dart SDK >= 3.0
