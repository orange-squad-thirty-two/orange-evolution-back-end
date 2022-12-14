CREATE DATABASE orange_evolution;

CREATE TABLE
    usuarios (
        id SERIAL PRIMARY KEY,
        nome VARCHAR(100) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        senha VARCHAR(300) NOT NULL
    );
CREATE TABLE
    administrador (
        id SERIAL PRIMARY KEY,
        nome VARCHAR(100) NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        senha VARCHAR(300) NOT NULL
    );
CREATE TABLE
    cursos (
        id serial primary key,
        nome VARCHAR(100) NOT NULL,     
        subtitulo text,
        descricao text,
        urlimage text
    );
CREATE TABLE
    todas_aulas(
        id SERIAL PRIMARY KEY,
        titulo VARCHAR(100) NOT NULL,
        tipo VARCHAR(100) NOT NULL,
        criador VARCHAR(100) NOT NULL,
        duracao VARCHAR(10),
        url VARCHAR(300) NOT NULL,
        status VARCHAR(30) DEFAULT 'Não iniciado',
      	curso_id INTEGER NOT NULL,
        FOREIGN KEY (curso_id) REFERENCES cursos (id)
    );
CREATE TABLE
    escolha(
        id SERIAL PRIMARY KEY,
        usuario_id INTEGER NOT NULL,
        curso_id INTEGER NOT NULL,
        FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
        FOREIGN KEY (curso_id) REFERENCES cursos (id)
    );
CREATE TABLE
    status(
        id SERIAL PRIMARY KEY,
        status VARCHAR(50) NOT NULL,
        usuario_id INTEGER NOT NULL,
        curso_id INTEGER NOT NULL,
        aula_id INTEGER NOT NULL,
        FOREIGN KEY(usuario_id) REFERENCES usuarios (id),
        FOREIGN KEY(curso_id) REFERENCES cursos (id)
    );
