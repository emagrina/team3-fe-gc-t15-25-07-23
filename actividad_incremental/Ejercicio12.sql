CREATE TABLE Empresa(
  CIF VARCHAR(15) PRIMARY KEY,
  nombre VARCHAR(50),
  dirección VARCHAR(100),
  teléfono VARCHAR(15),
  código_interno_empresa INT
);

CREATE TABLE Proyecto(
  ID_Proyecto INT PRIMARY KEY,
  fecha_inicio DATE,
  fecha_finalización DATE,
  fecha_prevista_finalización DATE,
  CIF_Empresa VARCHAR(15) REFERENCES Empresa(CIF)
);

CREATE TABLE Profesión(
  Código_Profesión INT PRIMARY KEY,
  nombre VARCHAR(50)
);

CREATE TABLE Trabajador(
  Código_Trabajador INT PRIMARY KEY,
  DNI VARCHAR(9),
  nombre VARCHAR(50),
  apellidos VARCHAR(50)
);

CREATE TABLE Participación(
  Código_Trabajador INT REFERENCES Trabajador(Código_Trabajador),
  ID_Proyecto INT REFERENCES Proyecto(ID_Proyecto),
  Código_Profesión INT REFERENCES Profesión(Código_Profesión),
  horas_trabajadas INT,
  PRIMARY KEY (Código_Trabajador, ID_Proyecto, Código_Profesión)
);