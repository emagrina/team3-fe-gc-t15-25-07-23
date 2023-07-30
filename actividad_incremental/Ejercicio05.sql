CREATE TABLE Pieza (
  ID_Pieza VARCHAR(4) PRIMARY KEY,
  descripcion VARCHAR(255),
  precio DECIMAL(10,2)
);

CREATE TABLE Almacen (
  ID_Almacen INT PRIMARY KEY,
  descripcion VARCHAR(255),
  direccion VARCHAR(255)
);

CREATE TABLE Estanteria (
  ID_Estanteria VARCHAR(3) PRIMARY KEY,
  nombre_estanteria VARCHAR(255)
);

CREATE TABLE Composicion (
  ID_Pieza VARCHAR(4),
  ID_Pieza_Componente VARCHAR(4),
  PRIMARY KEY (ID_Pieza, ID_Pieza_Componente),
  FOREIGN KEY (ID_Pieza) REFERENCES Pieza(ID_Pieza),
  FOREIGN KEY (ID_Pieza_Componente) REFERENCES Pieza(ID_Pieza)
);

CREATE TABLE Almacenamiento (
  ID_Almacen INT,
  ID_Estanteria VARCHAR(3),
  ID_Pieza VARCHAR(4),
  cantidad INT,
  PRIMARY KEY (ID_Almacen, ID_Estanteria, ID_Pieza),
  FOREIGN KEY (ID_Almacen) REFERENCES Almacen(ID_Almacen),
  FOREIGN KEY (ID_Estanteria) REFERENCES Estanteria(ID_Estanteria),
  FOREIGN KEY (ID_Pieza) REFERENCES Pieza(ID_Pieza)
);