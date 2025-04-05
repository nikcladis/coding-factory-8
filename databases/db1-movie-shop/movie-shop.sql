-- Πίνακας για ταινίες
CREATE TABLE films (
    film_id INT PRIMARY KEY IDENTITY,
    title NVARCHAR(100) NOT NULL,
    production_year INT,
    country_code CHAR(3),
    duration INT,
    director_first_name NVARCHAR(50),
    director_last_name NVARCHAR(50)
);

-- Πίνακας για ηθοποιούς
CREATE TABLE actors (
    actor_id INT PRIMARY KEY IDENTITY,
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL
);

-- Σχέση πολλών προς πολλούς: Ταινίες - Ηθοποιοί
CREATE TABLE films_actors (
    film_id INT,
    actor_id INT,
    PRIMARY KEY (film_id, actor_id),
    CONSTRAINT fk_film FOREIGN KEY (film_id) REFERENCES films(film_id),
    CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);

-- Πίνακας για κατηγορίες
CREATE TABLE categories (
    category_id INT PRIMARY KEY IDENTITY,
    category_name NVARCHAR(50) NOT NULL
);

-- Σχέση πολλών προς πολλούς: Ταινίες - Κατηγορίες
CREATE TABLE films_categories (
    film_id INT,
    category_id INT,
    PRIMARY KEY (film_id, category_id),
    CONSTRAINT fk_film_category FOREIGN KEY (film_id) REFERENCES films(film_id),
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Πίνακας για αντίγραφα ταινιών (DVD, Blu-ray κλπ.)
CREATE TABLE copies (
    barcode NVARCHAR(1000) PRIMARY KEY,
    film_id INT NOT NULL,
    media_format NVARCHAR(100) NOT NULL,
    sale_price NUMERIC(6,2) NOT NULL,
    CONSTRAINT fk_copy_film FOREIGN KEY (film_id) REFERENCES films(film_id)
);
