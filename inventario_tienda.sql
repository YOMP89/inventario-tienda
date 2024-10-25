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

-- Insertando categorías
INSERT INTO Categorias (nombre, descripcion) VALUES 
('Electrónica', 'Dispositivos electrónicos y accesorios'),
('Hogar', 'Productos para el hogar'),
('Ropa', 'Ropa y accesorios de moda');

-- Insertando productos
INSERT INTO Productos (nombre, descripcion, categoria_id, precio, stock) VALUES 
('Smartphone', 'Teléfono inteligente con pantalla táctil', 1, 399.99, 50),
('Televisor', 'Televisor LED de 50 pulgadas', 1, 599.99, 30),
('Sofá', 'Sofá de 3 plazas', 2, 299.99, 20),
('Camiseta', 'Camiseta de algodón 100%', 3, 19.99, 100);

-- Insertando proveedores
INSERT INTO Proveedores (nombre, direccion, telefono) VALUES 
('TechSupply', 'Calle 123, Ciudad', '123456789'),
('HomeGoods', 'Av. Principal 456, Ciudad', '987654321');

-- Insertando compras
INSERT INTO Compras (proveedor_id, producto_id, fecha_compra, cantidad) VALUES 
(1, 1, '2024-10-23', 100),
(2, 3, '2024-10-23', 50);
