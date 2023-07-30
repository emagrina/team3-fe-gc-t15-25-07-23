CREATE TABLE Cliente (
  DNI VARCHAR(9) PRIMARY KEY,
  nombre VARCHAR(50),
  apellidos VARCHAR(50),
  dirección VARCHAR(100),
  teléfono VARCHAR(15),
  número_tarjeta VARCHAR(20)
);

CREATE TABLE Reserva (
  ID_Reserva INT PRIMARY KEY,
  DNI_Cliente VARCHAR(9),
  número_plazas INT,
  fecha_reserva DATE,
  FOREIGN KEY (DNI_Cliente) REFERENCES Cliente(DNI)
);

CREATE TABLE Tarjeta_Embarque (
  ID_Tarjeta INT PRIMARY KEY,
  DNI_Cliente VARCHAR(9),
  ID_Reserva INT,
  fila INT,
  columna INT,
  planta INT,
  FOREIGN KEY (DNI_Cliente) REFERENCES Cliente(DNI),
  FOREIGN KEY (ID_Reserva) REFERENCES Reserva(ID_Reserva)
);

CREATE TABLE Aeropuerto (
  Código_Aeropuerto VARCHAR(5) PRIMARY KEY,
  nombre VARCHAR(50),
  localidad VARCHAR(50),
  país VARCHAR(50)
);

CREATE TABLE Avión (
  Código_Avión VARCHAR(6) PRIMARY KEY,
  número_plazas INT
);

CREATE TABLE Vuelo (
  Código_Vuelo VARCHAR(6) PRIMARY KEY,
  fecha_salida DATE,
  hora_salida TIME,
  fecha_llegada DATE,
  hora_llegada TIME,
  Código_Aeropuerto_Salida VARCHAR(5),
  Código_Aeropuerto_Llegada VARCHAR(5),
  Código_Avión VARCHAR(6),
  FOREIGN KEY (Código_Aeropuerto_Salida) REFERENCES Aeropuerto(Código_Aeropuerto),
  FOREIGN KEY (Código_Aeropuerto_Llegada) REFERENCES Aeropuerto(Código_Aeropuerto),
  FOREIGN KEY (Código_Avión) REFERENCES Avión(Código_Avión)
);

CREATE TABLE Reserva_Vuelo (
  ID_Reserva INT,
  Código_Vuelo VARCHAR(6),
  PRIMARY KEY (ID_Reserva, Código_Vuelo),
  FOREIGN KEY (ID_Reserva) REFERENCES Reserva(ID_Reserva),
  FOREIGN KEY (Código_Vuelo) REFERENCES Vuelo(Código_Vuelo)
);