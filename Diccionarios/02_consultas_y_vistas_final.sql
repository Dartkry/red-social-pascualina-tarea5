USE red_social_pascualina;

SELECT 
    CONCAT(u.nombres, ' ', u.apellidos) AS nombre_completo_estudiante,
    pa.programa AS carrera_universitaria,
    pa.semestre AS semestre_actual,
    h.nombre_hab AS habilidad_destacada,
    uh.nivel_dominio AS nivel_experiencia,
    COUNT(DISTINCT s.id_seguidor) AS total_seguidores
FROM usuario u
INNER JOIN perfil_acad pa ON u.id_usuario = pa.id_usuario
INNER JOIN usuario_habilidad uh ON u.id_usuario = uh.id_usuario
INNER JOIN habilidad h ON uh.id_habilidad = h.id_habilidad
LEFT JOIN seguidor s ON u.id_usuario = s.id_seguido
WHERE uh.nivel_dominio = 'Avanzado'
GROUP BY u.id_usuario, u.nombres, u.apellidos, pa.programa, pa.semestre, h.nombre_hab, uh.nivel_dominio
ORDER BY total_seguidores DESC, pa.semestre DESC;

SELECT 
    g.nombre_grupo AS nombre_comunidad,
    g.tematica AS area_de_interes,
    CONCAT(u.nombres, ' ', u.apellidos) AS estudiante_creador,
    COUNT(ug.id_usuario) AS cantidad_integrantes
FROM grupo g
INNER JOIN usuario u ON g.id_creador = u.id_usuario
LEFT JOIN usuario_grupo ug ON g.id_grupo = ug.id_grupo
GROUP BY g.id_grupo, g.nombre_grupo, g.tematica, u.nombres, u.apellidos
ORDER BY cantidad_integrantes DESC;

SELECT 
    p.categoria AS categoria_publicacion,
    COUNT(DISTINCT p.id_post) AS total_posts_publicados,
    COUNT(DISTINCT i.id_interaccion) AS total_reacciones_recibidas,
    COUNT(DISTINCT c.id_comentario) AS total_comentarios_recibidos
FROM post p
LEFT JOIN interaccion i ON p.id_post = i.id_post
LEFT JOIN comentario c ON p.id_post = c.id_post
GROUP BY p.categoria
ORDER BY total_reacciones_recibidas DESC;

SELECT 
    e.titulo AS nombre_del_evento,
    g.nombre_grupo AS grupo_organizador,
    DATE_FORMAT(e.fecha_evento, '%Y-%m-%d %H:%i') AS fecha_hora_evento,
    e.ubicacion AS lugar_del_evento,
    SUM(CASE WHEN a.estado_asistencia = 'Confirmado' THEN 1 ELSE 0 END) AS asistentes_confirmados,
    COUNT(a.id_usuario) AS total_interesados_registrados
FROM evento e
INNER JOIN grupo g ON e.id_grupo = g.id_grupo
LEFT JOIN asistencia a ON e.id_evento = a.id_evento
GROUP BY e.id_evento, e.titulo, g.nombre_grupo, e.fecha_evento, e.ubicacion
ORDER BY e.fecha_evento ASC;

SELECT 
    CONCAT(u.nombres, ' ', u.apellidos) AS autor_publicacion,
    pa.programa AS programa_academico,
    COUNT(DISTINCT p.id_post) AS cantidad_posts_creados,
    COUNT(i.id_interaccion) AS impacto_total_reacciones
FROM usuario u
INNER JOIN perfil_acad pa ON u.id_usuario = pa.id_usuario
INNER JOIN post p ON u.id_usuario = p.id_usuario
LEFT JOIN interaccion i ON p.id_post = i.id_post
GROUP BY u.id_usuario, u.nombres, u.apellidos, pa.programa
ORDER BY impacto_total_reacciones DESC;

SELECT 
    pa.programa AS nombre_programa_academico,
    COUNT(pa.id_usuario) AS total_estudiantes_inscritos,
    ROUND(AVG(pa.semestre), 1) AS promedio_semestre_cursado
FROM perfil_acad pa
GROUP BY pa.programa
ORDER BY total_estudiantes_inscritos DESC;

CREATE OR REPLACE VIEW vw_perfiles_habilidades AS
SELECT 
    u.id_usuario AS codigo_estudiante,
    CONCAT(u.nombres, ' ', u.apellidos) AS estudiante,
    u.correo_inst AS correo_institucional,
    pa.programa AS carrera,
    pa.semestre AS semestre_actual,
    h.nombre_hab AS habilidad_tecnica,
    uh.nivel_dominio AS dominio_habilidad
FROM usuario u
INNER JOIN perfil_acad pa ON u.id_usuario = pa.id_usuario
INNER JOIN usuario_habilidad uh ON u.id_usuario = uh.id_usuario
INNER JOIN habilidad h ON uh.id_habilidad = h.id_habilidad;

SELECT * FROM vw_perfiles_habilidades WHERE dominio_habilidad = 'Avanzado';

CREATE OR REPLACE VIEW vw_analitica_grupos_eventos AS
SELECT 
    g.id_grupo AS codigo_grupo,
    g.nombre_grupo AS comunidad,
    g.tematica AS tematica_grupo,
    COUNT(DISTINCT ug.id_usuario) AS total_miembros_activos,
    COUNT(DISTINCT e.id_evento) AS total_eventos_programados
FROM grupo g
LEFT JOIN usuario_grupo ug ON g.id_grupo = ug.id_grupo
LEFT JOIN evento e ON g.id_grupo = e.id_grupo
GROUP BY g.id_grupo, g.nombre_grupo, g.tematica;

SELECT * FROM vw_analitica_grupos_eventos ORDER BY total_miembros_activos DESC;

CREATE OR REPLACE VIEW vw_rendimiento_publicaciones AS
SELECT 
    p.id_post AS codigo_publicacion,
    CONCAT(u.nombres, ' ', u.apellidos) AS nombre_autor,
    p.categoria AS tipo_contenido,
    p.contenido AS texto_del_post,
    DATE_FORMAT(p.fecha_post, '%Y-%m-%d') AS fecha_publicacion,
    COUNT(DISTINCT i.id_interaccion) AS cantidad_reacciones,
    COUNT(DISTINCT c.id_comentario) AS cantidad_comentarios
FROM post p
INNER JOIN usuario u ON p.id_usuario = u.id_usuario
LEFT JOIN interaccion i ON p.id_post = i.id_post
LEFT JOIN comentario c ON p.id_post = c.id_post
GROUP BY p.id_post, u.nombres, u.apellidos, p.categoria, p.contenido, p.fecha_post;

SELECT * FROM vw_rendimiento_publicaciones ORDER BY cantidad_reacciones DESC;

CREATE OR REPLACE VIEW vw_red_seguidores AS
SELECT 
    CONCAT(u_seg.nombres, ' ', u_seg.apellidos) AS estudiante_seguidor,
    pa_seg.semestre AS semestre_seguidor,
    CONCAT(u_gui.nombres, ' ', u_gui.apellidos) AS estudiante_seguido,
    pa_gui.semestre AS semestre_seguido,
    pa_gui.programa AS programa_estudiante_seguido,
    DATE_FORMAT(s.fecha_inicio, '%Y-%m-%d') AS fecha_vinculo
FROM seguidor s
INNER JOIN usuario u_seg ON s.id_seguidor = u_seg.id_usuario
INNER JOIN perfil_acad pa_seg ON u_seg.id_usuario = pa_seg.id_usuario
INNER JOIN usuario u_gui ON s.id_seguido = u_gui.id_usuario
INNER JOIN perfil_acad pa_gui ON u_gui.id_usuario = pa_gui.id_usuario;

SELECT * FROM vw_red_seguidores;
