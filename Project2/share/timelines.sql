BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS users (
    id          INTEGER PRIMARY KEY,
    username    TEXT NOT NULL UNIQUE,
    post        TEXT NOT NULL,
);
