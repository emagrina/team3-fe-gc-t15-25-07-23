CREATE TABLE Empleado (
    DNI CHAR(9) PRIMARY KEY,
    nombre VARCHAR(100),
    apellidos VARCHAR(100),
    numero_SS CHAR(11),
    telefono_fijo CHAR(9),
    telefono_movil CHAR(9)
);

CREATE TABLE Cocinero (
    DNI CHAR(9) PRIMARY KEY,
    años_de_servicio INT,
    FOREIGN KEY (DNI) REFERENCES Empleado(DNI)
);

CREATE TABLE Pinche (
    DNI CHAR(9) PRIMARY KEY,
    fecha_nacimiento DATE,
    DNI_Cocinero CHAR(9),
    FOREIGN KEY (DNI) REFERENCES Empleado(DNI),
    FOREIGN KEY (DNI_Cocinero) REFERENCES Cocinero(DNI)
);

CREATE TABLE Plato (
    ID_Plato INT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(5,2),
    tipo_plato VARCHAR(50)
);

CREATE TABLE Ingrediente (
    ID_Ingrediente INT PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE Almacen (
    ID_Almacen INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(500)
);

CREATE TABLE Estante (
    ID_Estante INT PRIMARY KEY,
    letras CHAR(2),
    tamaño INT,
    ID_Almacen INT,
    FOREIGN KEY (ID_Almacen) REFERENCES Almacen(ID_Almacen)
);

CREATE TABLE Capaz_de_Preparar (
    DNI_Cocinero CHAR(9),
    ID_Plato INT,
    PRIMARY KEY (DNI_Cocinero, ID_Plato),
    FOREIGN KEY (DNI_Cocinero) REFERENCES Cocinero(DNI),
    FOREIGN KEY (ID_Plato) REFERENCES Plato(ID_Plato)
);

CREATE TABLE Compone (
    ID_Plato INT,
    ID_Ingrediente INT,
    cantidad INT,
    PRIMARY KEY (ID_Plato, ID_Ingrediente),
    FOREIGN KEY (ID_Plato) REFERENCES Plato(ID_Plato),
    FOREIGN KEY (ID_Ingrediente) REFERENCES Ingrediente(ID_Ingrediente)
);

CREATE TABLE Ubicado_en (
    ID_Ingrediente INT,
    ID_Estante INT,
    cantidad INT,
    PRIMARY KEY (ID_Ingrediente, ID_Estante),
    FOREIGN KEY (ID_Ingrediente) REFERENCES Ingrediente(ID_Ingrediente),
    FOREIGN KEY (ID_Estante) REFERENCES Estante(ID_Estante)
);
