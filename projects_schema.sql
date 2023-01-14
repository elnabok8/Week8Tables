DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project_category;


CREATE TABLE project_category (
project_id INT AUTO_INCREMENT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY (category_id, project_id)
);

CREATE TABLE category (
category_id INT AUTO_INCREMENT NOT NULL,
category_name VARCHAR(128) NOT NULL
PRIMARY KEY (category_id)
);

CREATE TABLE step (
step_id INT AUTO_INCREMENT NOT NULL,
project_id INT AUTO_INCREMENT NOT NULL,
step_text TEXT NOT NULL,
step_order INT AUTO_INCREMENT NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material (
material_id INT AUTO_INCREMENT NOT NULL,
project_id INT AUTO_INCREMENT NOT NULL,
material_name VARCHAR(128) NOT NULL,
num_required INT AUTO_INCREMENT NULL,
cost DECIMAL(7,2) NULL,
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE project (
project_id INT AUTO_INCREMENT NOT NULL,
project_name VARCHAR(128) NOT NULL,
estimated_hours DECIMAL(7,2) NULL
actual_hours DECIMAL(7,2) NULL,
difficulty INT NULL,
notes TEXT NULL,
PRIMARY KEY (project_id)
);
