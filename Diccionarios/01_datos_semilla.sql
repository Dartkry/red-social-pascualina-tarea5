USE red_social_pascualina;

DELETE FROM asistencia;
DELETE FROM evento;
DELETE FROM usuario_grupo;
DELETE FROM grupo;
DELETE FROM interaccion;
DELETE FROM comentario;
DELETE FROM post;
DELETE FROM seguidor;
DELETE FROM usuario_habilidad;
DELETE FROM habilidad;
DELETE FROM perfil_acad;
DELETE FROM usuario;

INSERT INTO usuario (id_usuario, nombres, apellidos, correo_inst, password, fecha_registro) VALUES
(1, 'Daniel', 'Grisales', 'd.grisales@pascualbravo.edu.co', 'hash_pass_123', '2026-08-01 08:30:00'),
(2, 'Sandra', 'Gómez', 's.gomez@pascualbravo.edu.co', 'hash_pass_456', '2026-08-03 10:15:00'),
(3, 'Miguel', 'Lopéz', 'm.lopez@pascualbravo.edu.co', 'hash_pass_789', '2026-08-05 14:20:00'),
(4, 'Lisa', 'Hernández', 'l.hernandez@pascualbravo.edu.co', 'hash_pass_321', '2026-08-10 09:00:00'),
(5, 'Andrés', 'Loaiza', 'a.loaiza@pascualbravo.edu.co', 'hash_pass_654', '2026-08-12 16:45:00'),
(6, 'Manuel', 'Osorio', 'm.osorio@pascualbravo.edu.co', 'hash_pass_987', '2026-08-15 11:10:00');

INSERT INTO perfil_acad (id_perfil, id_usuario, programa, semestre, biografia) VALUES
(1, 1, 'Tecnología en Desarrollo de Software', 3, 'Apasionado por bases de datos SQL, desarrollo en C++/Python y modding en PC.'),
(2, 2, 'Ingeniería de Software', 6, 'Mentora en programación competitiva y arquitectura de bases de datos.'),
(3, 3, 'Tecnología en Desarrollo de Software', 3, 'Entusiasta de circuitos digitales, microcontroladores ESP32 y lógica.'),
(4, 4, 'Tecnología en Desarrollo de Software', 2, 'Aprendiendo desarrollo web, diseño de interfaces y consultas SQL.'),
(5, 5, 'Ingeniería Eléctrica', 5, 'Interesado en automatización, IoT y deportes universitarios.'),
(6, 6, 'Ingeniería de Software', 7, 'Desarrollador backend y líder de semilleros de investigación.');

INSERT INTO habilidad (id_habilidad, nombre_hab) VALUES
(1, 'Bases de Datos SQL'),
(2, 'Programación en Python'),
(3, 'Lenguaje C++ y Microcontroladores'),
(4, 'Programación Competitiva'),
(5, 'Control de Versiones Git');

INSERT INTO usuario_habilidad (id_usuario, id_habilidad, nivel_dominio) VALUES
(1, 1, 'Avanzado'),
(1, 2, 'Intermedio'),
(1, 3, 'Intermedio'),
(2, 4, 'Avanzado'),
(2, 1, 'Avanzado'),
(3, 3, 'Avanzado'),
(4, 1, 'Básico'),
(6, 2, 'Avanzado'),
(6, 5, 'Avanzado');

INSERT INTO seguidor (id_seguidor, id_seguido, fecha_inicio) VALUES
(1, 2, '2026-09-01 09:00:00'),
(3, 1, '2026-09-02 10:30:00'),
(4, 1, '2026-09-03 11:15:00'),
(4, 2, '2026-09-04 15:00:00'),
(5, 3, '2026-09-05 17:20:00'),
(1, 6, '2026-09-06 08:45:00'),
(3, 2, '2026-09-07 12:00:00');

INSERT INTO post (id_post, id_usuario, contenido, categoria, fecha_post) VALUES
(1, 1, 'Comparto guía práctica para diseñar vistas y consultas DML en phpMyAdmin sin errores.', 'Recurso Útil', '2026-10-01 10:00:00'),
(2, 4, '¿Alguien me recomienda ejercicios para practicar INNER JOIN y LEFT JOIN para el taller?', 'Pregunta Tarea', '2026-10-02 14:30:00'),
(3, 2, 'Inscripciones abiertas para el torneo de programación competitiva Pascualina 2026.', 'Noticia Tech', '2026-10-05 09:15:00'),
(4, 3, 'Cuando el script SQL corre a la primera sin errores de clave foránea.', 'Meme Universitario', '2026-10-06 19:00:00'),
(5, 1, 'Resumen de comandos de Git con ramas para organizar repositorios de la universidad.', 'Recurso Útil', '2026-10-10 11:20:00');

INSERT INTO comentario (id_comentario, id_post, id_usuario, texto, fecha_coment) VALUES
(1, 1, 3, '¡Excelente aporte Daniel! Me sirvió mucho para el informe.', '2026-10-01 11:00:00'),
(2, 1, 4, 'Muchas gracias, está súper claro el ejemplo.', '2026-10-01 12:30:00'),
(3, 2, 1, 'Revisa el post que subí ayer, ahí dejé varios ejemplos comentados.', '2026-10-02 15:00:00'),
(4, 2, 2, 'También puedes apoyarte en el libro DML de la unidad 3.', '2026-10-02 16:10:00'),
(5, 3, 1, 'De una, ahí estaremos participando.', '2026-10-05 10:00:00');

INSERT INTO interaccion (id_interaccion, id_post, id_usuario, tipo_reaccion) VALUES
(1, 1, 2, 'Me gusta'),
(2, 1, 3, 'Útil'),
(3, 1, 4, 'Útil'),
(4, 1, 6, 'Me encanta'),
(5, 2, 1, 'Me gusta'),
(6, 3, 1, 'Me encanta'),
(7, 3, 3, 'Me gusta'),
(8, 3, 5, 'Me gusta'),
(9, 4, 1, 'Me divierte'),
(10, 4, 2, 'Me divierte'),
(11, 4, 4, 'Me divierte'),
(12, 5, 3, 'Útil'),
(13, 5, 6, 'Útil');

INSERT INTO grupo (id_grupo, id_creador, nombre_grupo, tematica) VALUES
(1, 1, 'Comunidad SQL y Bases de Datos', 'Estudio de Materias'),
(2, 2, 'Club Algoritmos y Maratones PB', 'Programación Competitiva'),
(3, 3, 'Semillero IoT y Microcontroladores', 'Hardware y Robótica'),
(4, 1, 'Gamers y Modding Pascualino', 'Videojuegos y PC');

INSERT INTO usuario_grupo (id_usuario, id_grupo, rol_usuario) VALUES
(1, 1, 'Administrador'),
(3, 1, 'Miembro'),
(4, 1, 'Miembro'),
(2, 2, 'Administrador'),
(1, 2, 'Miembro'),
(6, 2, 'Moderador'),
(3, 3, 'Administrador'),
(5, 3, 'Miembro'),
(1, 4, 'Administrador'),
(3, 4, 'Miembro'),
(5, 4, 'Miembro');

INSERT INTO evento (id_evento, id_grupo, titulo, fecha_evento, ubicacion, coordenadas) VALUES
(1, 1, 'Taller Práctico de Consultas DML y Vistas', '2026-11-15 16:00:00', 'Bloque 8 - Sala de Sistemas 204', '{"lat": 6.2745, "lng": -75.5912}'),
(2, 2, 'Entrenamiento Pre-Hackathon Pascualina', '2026-11-20 14:00:00', 'Laboratorio de Software 301', '{"lat": 6.2748, "lng": -75.5915}'),
(3, 4, 'Tarde de Juegos en PC y Optimización de Hardware', '2026-11-25 17:30:00', 'Auditorio Pascual Bravo', '{"lat": 6.2740, "lng": -75.5910}');

INSERT INTO asistencia (id_usuario, id_evento, estado_asistencia) VALUES
(1, 1, 'Confirmado'),
(3, 1, 'Confirmado'),
(4, 1, 'Confirmado'),
(2, 2, 'Confirmado'),
(1, 2, 'Interesado'),
(6, 2, 'Confirmado'),
(1, 3, 'Confirmado'),
(3, 3, 'Confirmado'),
(5, 3, 'Pendiente');
