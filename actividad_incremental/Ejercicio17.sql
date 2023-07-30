CREATE TABLE Horario (
    Dia_de_la_semana DATE,
    Hora TIMESTAMP,
    Codigo_de_horario INT PRIMARY KEY
);

CREATE TABLE Aula (
    Numero_de_aula INT PRIMARY KEY,
    Codigo_de_aula INT,
    Metros_cuadrados INT
);

CREATE TABLE Asignatura (
    Codigo_interno_del_centro INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Codigo_europeo INT,
    Curso_del_ciclo VARCHAR(255),
    Codigo_interno_del_curso INT,
    Numero_de_aula INT,
    FOREIGN KEY (Numero_de_aula) REFERENCES Aula(Numero_de_aula)
);

CREATE TABLE Horario_asignatura (
    Codigo_de_horario INT,
    Codigo_interno_del_centro INT,
    FOREIGN KEY (Codigo_de_horario) REFERENCES Horario(Codigo_de_horario),
    FOREIGN KEY (Codigo_interno_del_centro) REFERENCES Asignatura(Codigo_interno_del_centro)
);

CREATE TABLE Aula_asignatura (
    Numero_de_aula INT,
    Codigo_interno_del_centro INT,
    FOREIGN KEY (Numero_de_aula) REFERENCES Aula(Numero_de_aula),
    FOREIGN KEY (Codigo_interno_del_centro) REFERENCES Asignatura(Codigo_interno_del_centro)
);

CREATE TABLE Asignatura_requerida (
    Codigo_interno_del_centro INT,
    Asignatura_requerida VARCHAR(255),
    FOREIGN KEY (Codigo_interno_del_centro) REFERENCES Asignatura(Codigo_interno_del_centro)
);

CREATE TABLE Profesor (
    Codigo_interno_del_profesor INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Telefono INT,
    Email VARCHAR(255),
    DNI VARCHAR(255),
    Numero_de_Seguridad_Social VARCHAR(255),
    Antiguedad_impartiendo_cada_asignatura DATE,
    Años_de_antiguedad_como_tutor DATE,
    Inicio_de_enseñamiento DATE,
    Cese_de_enseñamiento DATE
);

CREATE TABLE Profesor_asignatura (
    Codigo_interno_del_profesor INT,
    Codigo_interno_del_centro INT,
    FOREIGN KEY (Codigo_interno_del_profesor) REFERENCES Profesor(Codigo_interno_del_profesor),
    FOREIGN KEY (Codigo_interno_del_centro) REFERENCES Asignatura(Codigo_interno_del_centro)
);

CREATE TABLE Ciclo (
    Codigo_interno_del_curso INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Tipo_de_grado VARCHAR(255),
    Codigo_europeo INT,
    Curso VARCHAR(255)
);

CREATE TABLE Profesor_ciclo (
    Codigo_interno_del_profesor INT,
    Codigo_interno_del_curso INT,
    FOREIGN KEY (Codigo_interno_del_profesor) REFERENCES Profesor(Codigo_interno_del_profesor),
    FOREIGN KEY (Codigo_interno_del_curso) REFERENCES Ciclo(Codigo_interno_del_curso)
);