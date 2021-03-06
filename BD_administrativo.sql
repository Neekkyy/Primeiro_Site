CREATE DATABASE administrativo;
USE administrativo;

CREATE TABLE Tbl_usuarios(
	Id_usuario INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Nome_usuario VARCHAR(60) NOT NULL,
	Email_usuario VARCHAR(255) NOT NULL,
    Username_usuario VARCHAR(40) NOT NULL, 
	Senha_usuario VARCHAR(255) NOT NULL
);

create table Tbl_cliente(
	Id_cliente INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Id_usuario INTEGER NOT NULL,
	CONSTRAINT FK_Id_usuario FOREIGN KEY (Id_usuario) REFERENCES Tbl_usuarios (Id_usuario),
	Segmento_cliente VARCHAR(50) NOT NULL,
	Nome_cliente VARCHAR(60) NOT NULL,
	Telefone_cliente VARCHAR(25) NOT NULL,
	Celular_cliente VARCHAR(25) NOT NULL,
	Email_cliente VARCHAR(255) NOT NULL,
	Uf_cliente CHAR(2) NOT NULL,
	Cidade_cliente VARCHAR(30) NOT NULL	
);

create table Tbl_eventos(
	Id_evento INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Id_cliente INTEGER NOT NULL,
	CONSTRAINT FK_Id_cliente FOREIGN KEY (Id_cliente) REFERENCES Tbl_cliente (Id_cliente),
	Nome_evento VARCHAR(40) NOT NULL,
	Data_inicio DATE NOT NULL,
	Data_termino DATE NOT NULL,
	Descricao_evento VARCHAR(240),
	Evento_imagem VARCHAR(240)		
);
create table Tbl_agenda(
	Id_agenda INTEGER AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Nome_agenda VARCHAR (50) NOT NULL,
	Inicio_agenda DATETIME NOT NULL,
	Final_agenda DATETIME NOT NULL,
	Descricao_agenda VARCHAR(240),
	Id_usuario INTEGER NOT NULL,
	CONSTRAINT FK_Id_usuario_Agenda FOREIGN KEY (Id_usuario) REFERENCES Tbl_usuarios (Id_usuario)
);

CREATE TABLE `tbl_subcliente` 
(
  `Email_SubCliente` varchar(300) NOT NULL,
 
 	`Nome_SubCliente` varchar(300) NOT NULL,
 
 	`Id_evento` int(11) NOT NULL,
 
	 CONSTRAINT `FK_Id_evento` FOREIGN KEY (`Id_evento`) 	REFERENCES `tbl_eventos` (`Id_evento`),
  	`Receber` int(11) NOT NULL,

	`DataSub` date NOT NULL,
    
    Id_cliente INTEGER NOT NULL,
	CONSTRAINT FK_Id_cliente_subcliente FOREIGN KEY (Id_cliente) REFERENCES Tbl_cliente (Id_cliente)
);

CREATE TABLE `Tbl_Estatisticas` 
(
 	 Id_evento INTEGER NOT NULL,
	CONSTRAINT FK_Id_evento_estatisticas FOREIGN KEY 	(Id_evento) REFERENCES Tbl_eventos (Id_evento),
    
	`DataEst` date NOT NULL,
	`Acessos` int(11) NOT NULL,
 
	 `Enviar` int(11) NOT NULL,

 	Id_cliente INTEGER NOT NULL,
	CONSTRAINT FK_Id_cliente_Estatisticas FOREIGN KEY (Id_cliente) REFERENCES Tbl_cliente (Id_cliente)
   
);