CREATE DATABASE InventarioTienda;
USE InventarioTienda;

-- Tabla de Categorías
CREATE TABLE Categorias (
    categoria_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255)
);

-- Tabla de Productos
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    categoria_id INT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

-- Tabla de Proveedores
CREATE TABLE Proveedores (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Tabla de Compras
CREATE TABLE Compras (
    compra_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    producto_id INT,
    fecha_compra DATE NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);
