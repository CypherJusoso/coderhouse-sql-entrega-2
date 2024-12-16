-- Insertar Usuarios
INSERT INTO User (username, email, contrasenia) VALUES 
('juan', 'juan@gmail.com', 'pass1'),
('pedro', 'pedro@gmail.com', 'pass2'),
('susana', 'susana@gmail.com', 'pass3');

-- Insertar Roles
INSERT INTO Role (role_name) VALUES 
('Admin'),
('Editor'),
('Viewer');

-- Asignar Roles
INSERT INTO User_role (user_id, role_id) VALUES 
(1, 1),  -- usuario1 -> Admin
(2, 2),  -- usuario2 -> Editor
(3, 3);  -- usuario3 -> Viewer

-- Insertar Imagenes con stored procedure
CALL insertar_imagen_sp(1, 'http://example.com/imagen1.jpg', 'Primera Imagen', '2024-06-01');
CALL insertar_imagen_sp(2, 'http://example.com/imagen2.jpg', 'Segunda Imagen', '2024-06-02');
CALL insertar_imagen_sp(3, 'http://example.com/imagen3.jpg', 'Tercera Imagen', '2024-06-03'); 

-- Insertar Likes y Dislikes
INSERT INTO Like_dislike (is_like, image_id, user_id) VALUES 
(TRUE, 1, 2),   -- usuario2 le da like a imagen1
(FALSE, 1, 3),  -- usuario3 le da dislike a imagen1
(TRUE, 2, 1),   -- usuario1 le da like a imagen2
(TRUE, 3, 2);   -- usuario2 le da like a imagen3

-- Insertar Comentarios con stored procedure
CALL insertar_comentario_sp(2, 1, '¡Me encanta esta imagen!', '2024-06-04');
CALL insertar_comentario_sp(3, 1, 'No está mal.', '2024-06-05');
CALL insertar_comentario_sp(1, 2, '¡Excelente!', '2024-06-06');

-- Insertar Tags
INSERT INTO Tag (tag_name) VALUES 
('Naturaleza'),
('Arte'),
('Tecnología');

-- Relacionar Tags con Imagenes
INSERT INTO Image_tag (image_id, tag_id) VALUES 
(1, 1),  -- Imagen1 -> Naturaleza
(2, 2),  -- Imagen2 -> Arte
(3, 3);  -- Imagen3 -> Tecnología
