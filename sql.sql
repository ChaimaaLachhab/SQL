create database diamant;

use diamant;

create table Invites(
id_invite INT AUTO_INCREMENT PRIMARY KEY,
nom varchar(225),
statut varchar(225)
);

INSERT INTO Invites (id_invite, nom, statut) VALUES (1,
'Jean Dupont'
,
'Suspect');
INSERT INTO Invites (id_invite, nom, statut) VALUES (2,
'Marie Curie'
,
'Innocent');
INSERT INTO Invites (id_invite, nom, statut) VALUES (3,
'Albert Einstein'
,
'Suspect');
INSERT INTO Invites (id_invite, nom, statut) VALUES (4,
'Isaac Newton'
,
'Innocent');
INSERT INTO Invites (id_invite, nom, statut) VALUES (5,
'Niels Bohr'
,
'Suspect');

create table rooms(
id_room INT AUTO_INCREMENT PRIMARY KEY, 
nom varchar(225) 
);

INSERT INTO rooms (id_room, nom) VALUES (1,
'Salle de Bal');
INSERT INTO rooms (id_room, nom) VALUES (2,
'Bibliothèque');
INSERT INTO rooms (id_room, nom) VALUES (3,
'Cuisine');
INSERT INTO rooms (id_room, nom) VALUES (4,
'Salon');
INSERT INTO rooms (id_room, nom) VALUES (5,
'Jardin');

create table Mouvements(
id_mouvement INT AUTO_INCREMENT PRIMARY KEY,
id_invite int,
id_room int,
FOREIGN KEY (id_invite) REFERENCES Invites(id_invite) ON DELETE CASCADE,
FOREIGN KEY (id_room) REFERENCES rooms(id_room) ON DELETE CASCADE,
time date
);

select * from Mouvements

INSERT INTO Mouvements (id_invite, id_room, time) VALUES
( 1, 1, '2023-06-01'),
(2, 1, '2023-06-01'),
(3, 2, '2023-06-01'),
(4, 3, '2023-06-01'),
(1, 2, '2023-06-02');

create table Objets(
id_objet INT AUTO_INCREMENT PRIMARY KEY,
nom_objet varchar(225), 
id_room int,  
FOREIGN KEY (id_room) REFERENCES rooms(id_room) ON DELETE CASCADE
);

INSERT INTO Objets (id_objet, nom_objet, id_room) VALUES (1,
'Vase Ancien'
, 1);
INSERT INTO Objets (id_objet, nom_objet, id_room) VALUES (2,
'Tableau de Maître'
, 2);
INSERT INTO Objets (id_objet, nom_objet, id_room) VALUES (3,
'Statue en Bronze'
, 3);
INSERT INTO Objets (id_objet, nom_objet, id_room) VALUES (4,
'Coffre à Bijoux'
, 2);
INSERT INTO Objets (id_objet, nom_objet, id_room) VALUES (5,
'Lampe en Cristal'
, 4);

create table Indices(
id_indice INT AUTO_INCREMENT PRIMARY KEY,
description varchar(225),
id_room int,
FOREIGN KEY (id_room) REFERENCES rooms(id_room) ON DELETE CASCADE
);

INSERT INTO Indices (id_indice, description, id_room) VALUES (1,
'Empreintes de pas trouvées près du vase'
, 1);
INSERT INTO Indices (id_indice, description, id_room) VALUES (2,
'Traces de sang sur la table'
, 2);
INSERT INTO Indices (id_indice, description, id_room) VALUES (3,
'Foulard déchiré retrouvé sur le sol'
, 3);
INSERT INTO Indices (id_indice, description, id_room) VALUES (4,
'Clé ancienne trouvée sous le canapé'
, 4);
INSERT INTO Indices (id_indice, description, id_room) VALUES (5,
'Bijou abandonné dans le jardin'
, 5);

-- Lister tous les invités

select * from Invites;

-- Lister les noms et statuts de tous les invités

select nom, statut from Invites;

-- Compter le nombre total d'invités

SELECT COUNT(*) AS total FROM Invites; 

-- Compter le nombre d'invités avec le statut 'Suspect' 

SELECT COUNT(*) AS total, statut FROM Invites where statut ="Suspect";

-- Trouver le premier mouvement enregistré de n'importe quel invité.

 select * from Mouvements m join Invites i on i.id_invite = m.id_invite where  m.id_invite = null
