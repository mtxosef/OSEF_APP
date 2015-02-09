-- Cambio 25 de Enero 2015


-- Cambio 3 de Febreo 2015
ALTER TABLE Revisiones ADD Origen VARCHAR(50) NULL
ALTER TABLE Revisiones ADD OrigenID VARCHAR(50) NULL

--Cambio 8 de Febrero 2015
ALTER TABLE Clientes ADD TipoSocio VARCHAR(20) NOT NULL
ALTER TABLE Clientes ADD NumeroSocio VARCHAR(11) NULL