USE red_social_pascualina;

SELECT 
    CONCAT(u.nombres, ' ', u.apellidos) AS nombre_completo_estudiante,
    pa.programa AS carrera_universitaria,
    h.nombre_hab AS habilidad_destacada,
    uh.nivel_dominio AS nivel_experiencia
FROM usuario u
INNER JOIN perfil_acad pa ON u.id_usuario = pa.id_usuario
INNER JOIN usuario_habilidad uh ON u.id_usuario = uh.id_usuario
INNER JOIN habilidad h ON uh.id_habilidad = h.id_habilidad
WHERE uh.nivel_dominio = 'Avanzado';

SELECT 
    g.nombre_grupo AS nombre_comunidad,
    COUNT(ug.id_usuario) AS cantidad_integrantes
FROM grupo g
LEFT JOIN usuario_grupo ug ON g.id_grupo = ug.id_grupo
GROUP BY g.id_grupo, g.nombre_grupo;

CREATE OR REPLACE VIEW vw_perfiles_habilidades AS
SELECT 
    u.id_usuario AS codigo_estudiante,
    CONCAT(u.nombres, ' ', u.apellidos) AS estudiante,
    pa.programa AS carrera,
    h.nombre_hab AS habilidad_tecnica,
    uh.nivel_dominio AS dominio_habilidad
FROM usuario u
INNER JOIN perfil_acad pa ON u.id_usuario = pa.id_usuario
INNER JOIN usuario_habilidad uh ON u.id_usuario = uh.id_usuario
INNER JOIN habilidad h ON uh.id_habilidad = h.id_habilidad;
