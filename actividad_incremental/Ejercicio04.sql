CREATE TABLE Guerra (
  ID_Guerra INT PRIMARY KEY,
  nombre_guerra VARCHAR(255),
  año_inicio INT,
  año_fin INT
);

CREATE TABLE Pais (
  ID_Pais INT PRIMARY KEY,
  nombre_pais VARCHAR(255),
  año_independencia_inicio INT,
  año_independencia_fin INT
);

CREATE TABLE Bando (
  ID_Bando INT PRIMARY KEY,
  nombre_bando VARCHAR(255)
);

CREATE TABLE Participacion (
  ID_Participacion INT PRIMARY KEY,
  ID_Guerra INT,
  ID_Pais INT,
  año_entrada INT,
  año_salida INT,
  ganador BOOLEAN,
  FOREIGN KEY (ID_Guerra) REFERENCES Guerra(ID_Guerra),
  FOREIGN KEY (ID_Pais) REFERENCES Pais(ID_Pais)
);

CREATE TABLE Afiliacion (
  ID_Afiliacion INT PRIMARY KEY,
  ID_Bando INT,
  ID_Pais INT,
  FOREIGN KEY (ID_Bando) REFERENCES Bando(ID_Bando),
  FOREIGN KEY (ID_Pais) REFERENCES Pais(ID_Pais)
);