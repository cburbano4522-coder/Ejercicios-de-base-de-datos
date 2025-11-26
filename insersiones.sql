-- Inserto mis especialidades.
INSERT INTO Especialidades (nombre_especialidad) VALUES
('Cardiología'), ('Dermatología'), ('Pediatría'), ('Neurología'),
('Ginecología'), ('Odontología'), ('Traumatología'), ('Rehabilitación'),
('Anestesiología'); 

-- Inserto mis equipos.
INSERT INTO equipos_medicos (nombre_equipo, numero_inventario, fecha_adquisicion) VALUES
('Máquina de Rayos X Siemens', 'XR-1001', '2020-05-15'), ('Ecógrafo Mindray', 'ECO-2002', '2021-09-01'),
('Monitor Cardíaco Philips', 'MON-3003', '2022-01-20'), ('Balanza Pediátrica', 'BAL-4004', '2023-03-10'),
('Mesa de Examen', 'MEX-5005', '2024-01-05'), ('Centrífuga de Laboratorio', 'CEN-6006', '2023-08-12'),
('Electrocardiógrafo', 'ECG-7007', '2023-10-15'); 

-- Inserto mis servicios.
INSERT INTO servicios_medicos (nombre_servicio, descripcion) VALUES
('Consulta General', 'Revisión y diagnóstico primario.'), ('Ecografía', 'Estudio de imagen por ultrasonido.'),
('Rayos X', 'Estudio de imagen con radiación ionizante.'), ('Laboratorio Clínico', 'Toma de muestras y análisis.'),
('Terapia Física', 'Rehabilitación y ejercicios.'), ('Vacunación', 'Aplicación de biológicos.');


INSERT INTO Vinculo_Servicio (id_servicio, id_equipo) VALUES
(3, 1), (2, 2), (1, 3), (5, 3), (4, 6), (1, 5); 

-- Inserto pacientes
INSERT INTO Pacientes (n_identificacion, nombre1, nombre2, apellido1, apellido2, fecha_nacimiento, telefono_paciente, direccion_paciente, estado_paciente) VALUES
('2001', 'Laura', 'Sofía', 'Pérez', 'Gómez', '1995-07-20', '3101234567', 'Calle 10 # 5-20', 1),
('2002', 'Ricardo', NULL, 'Márquez', 'Soto', '1980-03-15', '3101234568', 'Avenida 20 # 1-10', 1),
('2003', 'Valentina', 'Andrea', 'Rojas', 'Díaz', '2005-11-01', '3101234569', 'Carrera 7 # 15-B', 1),
('2004', 'Felipe', NULL, 'Herrera', 'Arias', '1975-01-25', '3101234570', 'Diagonal 30 # 8-A', 1),
('2005', 'Daniela', 'Carolina', 'Muñoz', 'Vega', '1999-09-10', '3101234571', 'Transversal 50 # 12-30', 1),
('2006', 'Javier', NULL, 'Ramos', 'León', '1988-04-18', '3101234572', 'Calle 90 # 1-D', 0), 
('2007', 'Luisa', 'María', 'Quintero', 'Gil', '1992-06-05', '3101234573', 'Avenida Principal 45', 1),
('2008', 'Ana', NULL, 'Giraldo', 'Paz', '1965-12-30', '3101234574', 'Carrera 15 # 60-C', 1); -- Paciente 'Ana' para la consulta 4.2

-- Inserto médicos.
INSERT INTO Medicos (n_colegiado, nombre1, nombre2, apellido1, apellido2, telefono, id_especialidad) VALUES
('MC1001', 'Dr. Juan', NULL, 'Restrepo', 'Silva', '3209876501', 1), -- ID 1 (Cardiología)
('MC1002', 'Dra. Ana', 'María', 'Martínez', 'Ríos', '3209876502', 2), 
('MC1003', 'Dr. Pedro', NULL, 'Gómez', 'Vargas', '3209876503', 3), -- ID 3 (Pediatría, usado en consulta 4.1)
('MC1004', 'Dra. Sofía', NULL, 'Díaz', 'López', '3209876504', 4), -- ID 4 (Neurología)
('MC1005', 'Dr. Luis', 'Fernando', 'Pérez', 'Gil', '3209876505', 5), 
('MC1006', 'Dra. María', NULL, 'Castro', 'Rojas', '3209876506', 6), 
('MC1007', 'Dr. Carlos', NULL, 'Zúñiga', 'Paz', '3209876509', 7); 

-- Inserto citas
INSERT INTO Citas (id_paciente, id_medico, id_servicio, fecha_hora, motivo, diagnostico) VALUES
(1, 1, 1, '2025-06-10 10:00:00', 'Chequeo de rutina', 'Paciente sano.'), 
(2, 4, 4, '2025-05-15 11:30:00', 'Revisión lunar', 'Nevus común.'), 
(3, 3, 6, '2025-07-01 09:00:00', 'Vacunación', 'Vacuna aplicada.'), 
(4, 4, 1, '2025-06-20 14:00:00', 'Dolores de cabeza', 'Migraña.'), 
(5, 5, 5, '2025-04-30 16:30:00', 'Examen anual', 'Resultados normales.'), 
(6, 1, 1, '2025-06-05 13:00:00', 'Dolor en el pecho', 'Angina de pecho.'), 
(8, 3, 2, '2025-05-20 15:00:00', 'Fiebre y tos', 'Resfriado común.'); 

