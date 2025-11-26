
CREATE DATABASE IF NOT EXISTS ClInica_Vida_Sana;
USE ClInica_Vida_Sana;

-- Defino la tabla Pacientes. Incluí el campo 'estado_paciente' para poder filtrar a los inactivos/fallecidos en la consulta 4.5.
CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    n_identificacion VARCHAR(20) NOT NULL UNIQUE,
    nombre1 VARCHAR(50) NOT NULL,
    nombre2 VARCHAR(50) NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono_paciente VARCHAR(15) NOT NULL,
    direccion_paciente VARCHAR(100) NOT NULL,
    estado_paciente TINYINT NOT NULL DEFAULT 1 
);

-- Defino la tabla Especialidades.
CREATE TABLE IF NOT EXISTS Especialidades (
    id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre_especialidad VARCHAR(80) NOT NULL UNIQUE
);

-- Defino la tabla Medicos. Mi FK a Especialidades modela la relación 1:N
CREATE TABLE IF NOT EXISTS Medicos (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    n_colegiado VARCHAR(20) NOT NULL UNIQUE,
    nombre1 VARCHAR(50) NOT NULL,
    nombre2 VARCHAR(50) NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50) NULL,
    telefono VARCHAR(15) NOT NULL,
    id_especialidad INT NOT NULL,


    CONSTRAINT fk_medico_especialidad FOREIGN KEY (id_especialidad) REFERENCES Especialidades(id_especialidad)
);

-- Defino la tabla Servicios_Medicos.
CREATE TABLE IF NOT EXISTS servicios_medicos (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    nombre_servicio VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT NULL
);

-- Defino la tabla Citas
CREATE TABLE IF NOT EXISTS Citas (
    id_cita INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    id_servicio INT NOT NULL, 
    fecha_hora DATETIME NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    diagnostico VARCHAR(500) NULL,


    CONSTRAINT fk_cita_paciente FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
    CONSTRAINT fk_cita_medico FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico),
    CONSTRAINT fk_cita_servicio FOREIGN KEY (id_servicio) REFERENCES servicios_medicos(id_servicio)
);

-- Defino la tabla Equipos_Medicos.
CREATE TABLE IF NOT EXISTS equipos_medicos (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(100) NOT NULL,
    numero_inventario VARCHAR(50) NOT NULL UNIQUE,
    fecha_adquisicion DATE NULL
);

-- Esta es la tabla de unión para resolver la relación N:M ("REQUIERE").
-- Decidí llamarla Vinculo_Servicio, usando id_vinculo como PK para simplificar las referencias.
CREATE TABLE IF NOT EXISTS Vinculo_Servicio (
    id_servicio INT NOT NULL,
    id_equipo INT NOT NULL,
    id_vinculo INT PRIMARY KEY AUTO_INCREMENT,

    CONSTRAINT fk_vs_servicio FOREIGN KEY (id_servicio) REFERENCES servicios_medicos(id_servicio),
    CONSTRAINT fk_vs_equipo FOREIGN KEY (id_equipo) REFERENCES equipos_medicos(id_equipo)
);