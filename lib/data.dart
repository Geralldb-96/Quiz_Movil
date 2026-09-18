import 'package:flutter/material.dart';

/// Los modelos separan la información de los widgets que la dibujan.
/// Todo es ficticio y local: no hay base de datos ni autenticación real.
class CampusClass {
  const CampusClass(
    this.start,
    this.end,
    this.name,
    this.room,
    this.teacher,
    this.color,
  );
  final String start;
  final String end;
  final String name;
  final String room;
  final String teacher;
  final Color color;
}

class CampusTask {
  const CampusTask(
    this.title,
    this.subject,
    this.due,
    this.description,
    this.color, {
    this.urgent = false,
  });
  final String title;
  final String subject;
  final String due;
  final String description;
  final Color color;
  final bool urgent;
}

class CampusNotice {
  const CampusNotice(
    this.category,
    this.title,
    this.source,
    this.body,
    this.color, {
    this.read = false,
  });
  final String category;
  final String title;
  final String source;
  final String body;
  final Color color;
  final bool read;
}

class CampusEvent {
  const CampusEvent(
    this.day,
    this.title,
    this.place,
    this.category,
    this.capacity,
    this.description,
    this.color,
  );
  final String day;
  final String title;
  final String place;
  final String category;
  final String capacity;
  final String description;
  final Color color;
}

const campusClasses = [
  CampusClass(
    '07:00',
    '09:00',
    'Álgebra Lineal',
    'Aula 201',
    'Prof. Gómez',
    Color(0xFF0891B2),
  ),
  CampusClass(
    '10:00',
    '12:00',
    'Cálculo II',
    'Aula 304',
    'Dr. Ramírez',
    Color(0xFF5B4FE8),
  ),
  CampusClass(
    '14:00',
    '16:00',
    'Programación',
    'Lab 12',
    'Ing. Torres',
    Color(0xFF7C3AED),
  ),
  CampusClass(
    '16:00',
    '17:00',
    'Inglés Técnico',
    'Aula 108',
    'Ms. Vega',
    Color(0xFFD97706),
  ),
];

const campusTasks = [
  CampusTask(
    'Informe de laboratorio #3',
    'Física III',
    'Hoy 23:59',
    'Prepara el informe del tercer laboratorio y entrégalo en el aula virtual.',
    Color(0xFFEF4444),
    urgent: true,
  ),
  CampusTask(
    'Ejercicios capítulo 7',
    'Cálculo II',
    'Mañana 08:00',
    'Resuelve los ejercicios asignados del capítulo 7.',
    Color(0xFFD97706),
  ),
  CampusTask(
    'Proyecto final — sistema de inventario',
    'Programación',
    '25 sep',
    'Entrega el proyecto de sistema de inventario con su documentación.',
    Color(0xFF5B4FE8),
  ),
  CampusTask(
    'Ensayo: tecnología y sociedad',
    'Inglés Técnico',
    '28 sep',
    'Escribe un ensayo sobre la relación entre tecnología y sociedad.',
    Color(0xFF0891B2),
  ),
];

const campusNotices = [
  CampusNotice(
    'Académico',
    'Cierre de notas parciales — 20 sep',
    'Registro académico · Hace 1h',
    'Los docentes deben ingresar calificaciones antes del viernes 20 a las 23:59.',
    Color(0xFF0891B2),
  ),
  CampusNotice(
    'Eventos',
    'Semana cultural — inscripción abierta',
    'Decanatura · Hace 3h',
    'Talleres, conciertos y conferencias. Inscríbete antes del 19 de septiembre.',
    Color(0xFFD97706),
  ),
  CampusNotice(
    'Bienestar',
    'Campaña de vacunación en campus',
    'Bienestar universitario · Ayer',
    'Vacunación gratuita en el pabellón médico, miércoles de 9:00 a. m. a 4:00 p. m.',
    Color(0xFF7C3AED),
    read: true,
  ),
  CampusNotice(
    'TI',
    'Mantenimiento del portal — domingo 2 a. m.',
    'Sistemas · Hace 2 días',
    'El portal estará fuera de servicio el domingo de 2:00 a 4:00 a. m.',
    Color(0xFF5B4FE8),
    read: true,
  ),
];

const campusEvents = [
  CampusEvent(
    '22',
    'Feria de proyectos académicos',
    'Pabellón A',
    'Académico',
    '80 cupos',
    'Exposición de proyectos creados por estudiantes.',
    Color(0xFF0891B2),
  ),
  CampusEvent(
    '24',
    'Conferencia: IA en la industria',
    'Auditorio principal',
    'Tecnología',
    '200 cupos',
    'Conferencia sobre aplicaciones actuales de inteligencia artificial.',
    Color(0xFF5B4FE8),
  ),
  CampusEvent(
    '26',
    'Hackathon 24 horas',
    'Sala digital',
    'Competencia',
    '40 cupos',
    'Reto de desarrollo en equipos durante 24 horas.',
    Color(0xFF7C3AED),
  ),
  CampusEvent(
    '30',
    'Noche cultural universitaria',
    'Plaza central',
    'Cultura',
    'Libre',
    'Presentaciones artísticas y encuentro de la comunidad universitaria.',
    Color(0xFFD97706),
  ),
];
