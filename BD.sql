create database AJ;
use AJ;


create table Usuarios(email_usua char(30), tipo_usua BOOLEAN, pass_usua blob, PRIMARY KEY(email_usua)); 
INSERT INTO Usuarios VALUES("Rodrigo@gmail.com",1,"admin123"); 
INSERT INTO Usuarios VALUES("Emilio@gmail.com",1,"admin234"); 
INSERT INTO Usuarios VALUES("Angel@gmail.com",1,"admin345"); 
INSERT INTO Usuarios VALUES("Juan@gmail.com",2,"juan123"); 
INSERT INTO Usuarios VALUES("Pedro@gmail.com",2,"pedro123"); 
INSERT INTO Usuarios VALUES("Saul@gmail.com",2,"saul123"); 

create table Estado(id_est char(15), nom_est char(25), PRIMARY KEY(id_est));
INSERT INTO Estado VALUES('01', 'Aguascalientes');
INSERT INTO Estado VALUES('02', 'Baja California');
INSERT INTO Estado VALUES('03', 'Baja California Sur');
INSERT INTO Estado VALUES('04', 'Campeche');
INSERT INTO Estado VALUES('05', 'Chiapas');
INSERT INTO Estado VALUES('06', 'Chihuahua');
INSERT INTO Estado VALUES('07', 'Ciudad de México');
INSERT INTO Estado VALUES('08', 'Coahuila');
INSERT INTO Estado VALUES('09', 'Colima');
INSERT INTO Estado VALUES('10', 'Durango');
INSERT INTO Estado VALUES('11', 'Estado de México');
INSERT INTO Estado VALUES('12', 'Guanajuato');
INSERT INTO Estado VALUES('13', 'Guerrero');
INSERT INTO Estado VALUES('14', 'Hidalgo');
INSERT INTO Estado VALUES('15', 'Jalisco');
INSERT INTO Estado VALUES('16', 'Michoacán');
INSERT INTO Estado VALUES('17', 'Morelos');
INSERT INTO Estado VALUES('18', 'Nayarit');
INSERT INTO Estado VALUES('19', 'Nuevo León');
INSERT INTO Estado VALUES('20', 'Oaxaca');
INSERT INTO Estado VALUES('21', 'Puebla');
INSERT INTO Estado VALUES('22', 'Querétaro');
INSERT INTO Estado VALUES('23', 'Quintana Roo');
INSERT INTO Estado VALUES('24', 'San Luis Potosí');
INSERT INTO Estado VALUES('25', 'Sinaloa');
INSERT INTO Estado VALUES('26', 'Sonora');
INSERT INTO Estado VALUES('27', 'Tabasco');
INSERT INTO Estado VALUES('28', 'Tamaulipas');
INSERT INTO Estado VALUES('29', 'Tlaxcala');
INSERT INTO Estado VALUES('30', 'Veracruz');
INSERT INTO Estado VALUES('31', 'Yucatán');
INSERT INTO Estado VALUES('32', 'Zacatecas');

create table Municipio(id_mun char(15), id_est char(15),nom_mun char(30), PRIMARY KEY(id_mun), FOREIGN KEY(id_est) REFERENCES Estado(id_est));
INSERT INTO Municipio VALUES('01','22','Queretaro');
INSERT INTO Municipio VALUES('02','22','Amealco');
INSERT INTO Municipio VALUES('03','22','Toliman');
INSERT INTO Municipio VALUES('04','21','Acajate');
INSERT INTO Municipio VALUES('05','21','Acateno');
INSERT INTO Municipio VALUES('06','21','Aclatan');
INSERT INTO Municipio VALUES('07','23','Cozumel');
INSERT INTO Municipio VALUES('08','23','Tulum');
INSERT INTO Municipio VALUES('09','23','Isla Mujeres');

create table Cliente(id_clie char(15), email_usua char(30),id_mun char(15),nom_clie char(30), ap_clie char(25), am_clie char(25),call_clie char(25),col_clie char(25),cp_clie char(15),ni_clie int(5),ne_clie int(5),tel_clie char(20), PRIMARY KEY(id_clie), FOREIGN KEY(email_usua) REFERENCES Usuarios(email_usua), FOREIGN KEY(id_mun) REFERENCES Municipio(id_mun));
INSERT INTO Cliente VALUES("001","Juan@gmail.com","01","Juan","Lopez","Lopez","Fray Luis","Vista Bonita","76234","12","45","4421234567");
INSERT INTO Cliente VALUES("002","Pedro@gmail.com","01","Pedro","Perez","Navarro","Cerrito","Lomas","79562","15","34","4423274869");
INSERT INTO Cliente VALUES("003","Saul@gmail.com","01","Saul","Quintanilla","Montes","Benito","Santa fe","77659","5","64","4429284297");

create table Sucursal(id_suc char(15),id_mun char(15),call_suc char(20), col_suc char(20),cp_suc char(10), ni_suc int(5), ne_suc int(5), PRIMARY KEY(id_suc), FOREIGN KEY(id_mun) REFERENCES Municipio(id_mun));
INSERT INTO Sucursal VALUES("suc1","01","playa mocambo","junipero","76134",12,64);
INSERT INTO Sucursal VALUES("suc2","08","josefina vicens","ruby","76532",10,24);
INSERT INTO Sucursal VALUES("suc3","04","la raza","conin","72174",5,34);

create table Talla(num_tall char(15), nom_tall char(15), PRIMARY KEY(num_tall));
INSERT INTO Talla VALUES("10","Chica");
INSERT INTO Talla VALUES("20","Mediana");
INSERT INTO Talla VALUES("30","Grande");

create table Categoria(cve_cat char(20), nom_cat char(20), PRIMARY KEY(cve_cat));
INSERT INTO Categoria VALUES("100","Anillo");
INSERT INTO Categoria VALUES("101","Cadena");

create table Producto(id_prod char(10),num_tall char(15),cve_cat char(20),nom_prod char(50),desc_prod text,url_prod char(50), color_prod char(15), prec_prod dec(10,2), costo_prod dec(10,2),PRIMARY KEY(id_prod), FOREIGN KEY(num_tall) REFERENCES Talla(num_tall), FOREIGN KEY(cve_cat) REFERENCES Categoria(cve_cat));
INSERT INTO Producto VALUES("001","10","101","Cadena de Plata","Una cadena que está hecha de plata, un metal precioso que se ha utilizado en la joyería durante siglos debido a su belleza y durabilidad.La cadena suele tener un diseño que la hace destacar, con eslabones delgados y sólidos quele dan un aspecto discreto.","img.jpg","plata",250.00,300.00);
INSERT INTO Producto VALUES("002","10","101","Cadena Gruesa de Oro","Una cadena que está hecha de oro, un metal precioso altamente valorado por su brillo y durabilidad, que ha sido apreciado a lo largo de la historia como símbolo de riqueza y estatus.La cadena suele estar diseñada con eslabones anchos y sólidos, lo que le confiere un aspecto llamativo y sólido.","img2.jpg","oro",250.00,300.00);
INSERT INTO Producto VALUES("003","30","101","Cadena de Plata con Cruz","Una cadena de plata con una cruz es una pieza de joyería que combina la belleza de la plata con un símbolo religioso icónico, la cruz. Estas cadenas son elegantes y significativas, y pueden ser usadas tanto como una expresión de fe como un accesorio de moda con un toque espiritual.","img3.jpg","plata",250.00,300.00);
INSERT INTO Producto VALUES("004","20","101","Cadena de Oro con Cruz","Una cadena de oro con una cruz es una pieza de joyería que combina la belleza de la plata con un símbolo religioso icónico, la cruz. Estas cadenas son elegantes y significativas, y pueden ser usadas tanto como una expresión de fe como un accesorio de moda con un toque espiritual.","img4.jpg","oro",250.00,300.00);
INSERT INTO Producto VALUES("005","10","101","manga larga AJolote","","img5.jpg","azul",250.00,300.00);
INSERT INTO Producto VALUES("006","20","100","Anillo de Plata con Dragon","Un anillo de plata con un dragón es una pieza de joyería fascinante que combina la belleza de la plata con la intriga y el simbolismo del dragón, un elemento legendario en muchas culturas y mitologías.","img6.jpg","plata",250.00,300.00);
INSERT INTO Producto VALUES("007","20","100","Anillo de Plata con Lobo",">Un anillo de plata con un lobo es una joya que combina la belleza de la plata con la representación de uno de los animales más emblemáticos y poderosos de la naturaleza, el lobo.","img7.jpg","plata",250.00,300.00);
INSERT INTO Producto VALUES("008","30","100","Anillo de Plata con Brujula Vikinga","Un anillo de plata con brújula vikinga es una joya que combina la belleza de la plata con un diseño inspirado en las antiguas brújulas vikingas, que eran herramientas de navegación utilizadas por los marineros vikingos.","img8.jpg","plata",250.00,300.00);
INSERT INTO Producto VALUES("009","30","100","Anillo de Plata con Alas","Un anillo de plata con alas es una pieza de joyería que combina la elegancia de la plata con la representación artística de alas, un motivo simbólico que puede evocar una variedad de significados y emociones.","img9.jpg","plata",250.00,300.00);
INSERT INTO Producto VALUES("010","30","100","manga corta mexico","","img1.jpg","rojo",250.00,300.00);

create table Inventario(no_inv char(20), id_suc char(15), id_prod char(10),exist_inv char(20), PRIMARY KEY(no_inv), FOREIGN KEY(id_suc) REFERENCES Sucursal(id_suc), FOREIGN KEY(id_prod) REFERENCES Producto(id_prod));
INSERT INTO Inventario VALUES("501","suc1","001","50");
INSERT INTO Inventario VALUES("502","suc1","002","25");
INSERT INTO Inventario VALUES("503","suc2","003","40");
INSERT INTO Inventario VALUES("504","suc3","004","25");
INSERT INTO Inventario VALUES("505","suc2","005","45");

create table Venta(no_ven char(15), id_clie char(15),fec_ven date,PRIMARY KEY(no_ven), FOREIGN KEY(id_clie) REFERENCES Cliente(id_clie));
INSERT INTO Venta VALUES("001","003","2023-09-19");
INSERT INTO Venta VALUES("002","001","2023-09-20");
INSERT INTO Venta VALUES("003","001","2023-09-21");
INSERT INTO Venta VALUES("004","003","2023-09-22");
INSERT INTO Venta VALUES("005","002","2023-09-22");

create table Det_Ven(cant_prod char(20), no_ven char(15), no_inv char(20), FOREIGN KEY(no_ven) REFERENCES Venta(no_ven), FOREIGN KEY(no_inv) REFERENCES Inventario(no_inv));
INSERT INTO Det_Ven VALUES("3","001","501");
INSERT INTO Det_Ven VALUES("5","002","502");
INSERT INTO Det_Ven VALUES("10","003","505");
INSERT INTO Det_Ven VALUES("2","004","503");
INSERT INTO Det_Ven VALUES("1","005","504");

create table Pago(cve_pag char(15), no_ven char(15),tip_pag char(20), impor_pag char(20),PRIMARY KEY(cve_pag), FOREIGN KEY(no_ven) REFERENCES Venta(no_ven));
INSERT INTO Pago VALUES("01","001","Debito","750");
INSERT INTO Pago VALUES("02","002","PayPal","1250");
INSERT INTO Pago VALUES("03","003","PayPal","2500");
INSERT INTO Pago VALUES("04","004","Debito","500");
INSERT INTO Pago VALUES("05","005","Debito","250");

create table Factura(fol_fac char(15), fec_fac date, no_ven char(15),PRIMARY KEY(fol_fac), FOREIGN KEY(no_ven) REFERENCES Venta(no_ven));
INSERT INTO Factura VALUES("123","2023-09-19","001");
INSERT INTO Factura VALUES("124","2023-09-20","002");
INSERT INTO Factura VALUES("125","2023-09-21","003");
INSERT INTO Factura VALUES("126","2023-09-22","004");
INSERT INTO Factura VALUES("127","2023-09-22","005");






DELIMITER $$
CREATE TRIGGER tipousuario AFTER INSERT ON Usuarios
FOR EACH ROW
BEGIN
    IF NEW.tipo_usua = 2 THEN
        INSERT INTO Cliente (id_clie, tel_clie, cp_clie, nom_clie, ap_clie, am_clie, call_clie, col_clie, ni_clie, ne_clie)
        VALUES (NEW.email_usua, '', '', '', '', '', '', '', 0, 0);
    ELSEIF NEW.tipo_usua = 1 THEN
        INSERT INTO Usuarios (email_usua, tipo_usua, pass_usua)
        VALUES (NEW.email_usua, NEW.tipo_usua, NEW.pass_usua);
    END IF;
END;
$$
DELIMITER ;







delimiter //
CREATE TRIGGER encripta
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
set new.pass_usua=aes_encrypt(new.pass_usua,"izazu");
end //


SELECT aes_decrypt(pass_usua, 'izazu') FROM Usuarios;
SELECT CAST(aes_decrypt(pass_usua,'izazu') AS CHAR) AS password FROM Usuarios;

