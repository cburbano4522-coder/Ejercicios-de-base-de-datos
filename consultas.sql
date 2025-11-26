USE ClInica_Vida_Sana;

SELECT 
    c.id_cita, c.fecha_hora, c.motivo, sm.nombre_servicio
FROM Citas c -- la c al final es para ponerle un alias a la tabla solo en la consulta actual
INNER JOIN servicios_medicos sm ON c.id_servicio = sm.id_servicio
WHERE c.id_medico = 3 AND c.id_servicio = 2;

SELECT n_identificacion, nombre1, apellido1
FROM Pacientes
WHERE nombre1 LIKE 'Ana%';

SELECT id_cita, fecha_hora, motivo
FROM Citas
WHERE fecha_hora BETWEEN '2025-05-01 00:00:00' AND '2025-06-25 23:59:59';

-- Uso INNER JOIN para acceder al nombre de la especialidad.
SELECT 
    m.nombre1, 
    m.apellido1, 
    e.nombre_especialidad
FROM Medicos m
INNER JOIN Especialidades e ON m.id_especialidad = e.id_especialidad
WHERE e.nombre_especialidad IN ('Cardiología', 'Neurología', 'Pediatría');

-- Uso TIMESTAMPDIFF para calcular la edad a partir de la fecha de nacimiento.
SELECT 
    n_identificacion, 
    nombre1, 
    apellido1,
    TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS Edad_Actual
FROM Pacientes
WHERE estado_paciente = 0;



-- Usé INNER JOINs en cadena, ya que necesito que la cita tenga un valor en las tres foraneas.
SELECT
    c.fecha_hora,
    sm.nombre_servicio,
    p.nombre1,
    p.apellido1,
    m.nombre1,
    m.apellido1
FROM Citas c
INNER JOIN Pacientes p ON c.id_paciente = p.id_paciente
INNER JOIN Medicos m ON c.id_medico = m.id_medico
INNER JOIN servicios_medicos sm ON c.id_servicio = sm.id_servicio;

-- Uso INNER JOIN para vincular el médico con su respectiva especialidad.
SELECT
    m.nombre1,
    m.apellido1,
    e.nombre_especialidad
FROM Medicos m
INNER JOIN Especialidades e ON m.id_especialidad = e.id_especialidad;

-- Uso INNER JOINs para recorrer la tabla de unión Vinculo_Servicio.
SELECT
    sm.nombre_servicio,
    em.nombre_equipo
FROM servicios_medicos sm
INNER JOIN Vinculo_Servicio vs ON sm.id_servicio = vs.id_servicio
INNER JOIN equipos_medicos em ON vs.id_equipo = em.id_equipo;

-- Uso LEFT JOIN para asegurar que me muestre TODOS los pacientes, incluso si no tienen citas.
SELECT
    p.nombre1,
    p.apellido1,
    c.fecha_hora,
    c.motivo
FROM Pacientes p
LEFT JOIN Citas c ON p.id_paciente = c.id_paciente
ORDER BY p.apellido1;

-- Uso LEFT JOIN. Servicios_Medicos es la tabla izquierda para incluir servicios que no usen equipos.
SELECT
    sm.nombre_servicio,
    em.nombre_equipo
FROM servicios_medicos sm
LEFT JOIN Vinculo_Servicio vs ON sm.id_servicio = vs.id_servicio
LEFT JOIN equipos_medicos em ON vs.id_equipo = em.id_equipo


-- Uso LEFT JOIN. Medicos es la tabla izquierda para incluir a todos los profesionales, tengan o no citas.
SELECT
    m.nombre1,
    m.apellido1,
    c.fecha_hora,
    c.motivo
FROM Medicos m
LEFT JOIN Citas c ON m.id_medico = c.id_medico


-- Uso LEFT JOIN, con Citas como tabla izquierda. Pese a que el campo es NOT NULL, se usa la lógica del requisito.
SELECT
    c.fecha_hora,
    c.motivo,
    p.nombre1,
    p.apellido1
FROM Citas c
LEFT JOIN Pacientes p ON c.id_paciente = p.id_paciente


-- Uso LEFT JOIN. Especialidades es la tabla izquierda para incluir las especialidades sin médicos asignados.
SELECT
    e.nombre_especialidad,
    m.nombre1,
    m.apellido1
FROM Especialidades e
LEFT JOIN Medicos m ON e.id_especialidad = m.id_especialidad


-- Uso LEFT JOIN. Equipos_Medicos es la tabla izquierda para incluir equipos que no han sido asignados a ningún servicio.
SELECT
    em.nombre_equipo,
    sm.nombre_servicio
FROM equipos_medicos em
LEFT JOIN Vinculo_Servicio vs ON em.id_equipo = vs.id_equipo
LEFT JOIN servicios_medicos sm ON vs.id_servicio = sm.id_servicio
