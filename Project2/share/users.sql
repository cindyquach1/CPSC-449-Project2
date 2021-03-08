BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS users (
    id          INTEGER PRIMARY KEY,
    username    TEXT NOT NULL UNIQUE,
    email       TEXT NOT NULL UNIQUE,
    pw          TEXT NOT NULL,
    followers   TEXT NOT NULL UNIQUE,
);

INSERT INTO users VALUES(1, 'JohnLegend', 'JohnLegend@csu.fullerton.edu', 'John*123');

COMMIT;