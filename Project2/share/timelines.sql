PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS posts (
    id              INTEGER PRIMARY KEY,
    username        TEXT NOT NULL,
    post            TEXT NOT NULL,
    timestamp       INTEGER DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO posts(username, post) VALUES('JohnLegend', "All of me");
INSERT INTO posts(username, post) VALUES('TaylorSwift', "You belong with me");
INSERT INTO posts(username, post) VALUES('BrunoMars', "Locked out of heaven");

CREATE INDEX IF NOT EXISTS post_username_idx ON posts(username);
CREATE INDEX IF NOT EXISTS post_timestamp_idx ON posts(timestamp);

COMMIT;