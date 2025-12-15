// ============================
// CONSTRAINTS
// ============================

// USERS
CREATE CONSTRAINT user_id_unique
IF NOT EXISTS
FOR (u:User)
REQUIRE u.id IS UNIQUE;

// MOVIES
CREATE CONSTRAINT movie_id_unique
IF NOT EXISTS
FOR (m:Movie)
REQUIRE m.id IS UNIQUE;

// SERIES
CREATE CONSTRAINT serie_id_unique
IF NOT EXISTS
FOR (s:Serie)
REQUIRE s.id IS UNIQUE;

// ACTORS
CREATE CONSTRAINT actor_id_unique
IF NOT EXISTS
FOR (a:Actor)
REQUIRE a.id IS UNIQUE;

// DIRECTORS
CREATE CONSTRAINT director_id_unique
IF NOT EXISTS
FOR (d:Director)
REQUIRE d.id IS UNIQUE;

// GENRES
CREATE CONSTRAINT genre_name_unique
IF NOT EXISTS
FOR (g:Genre)
REQUIRE g.name IS UNIQUE;

// ============================
// CONSTRAINTS
// ============================

// USERS
CREATE CONSTRAINT user_id_unique
IF NOT EXISTS
FOR (u:User)
REQUIRE u.id IS UNIQUE;

// MOVIES
CREATE CONSTRAINT movie_id_unique
IF NOT EXISTS
FOR (m:Movie)
REQUIRE m.id IS UNIQUE;

// SERIES
CREATE CONSTRAINT serie_id_unique
IF NOT EXISTS
FOR (s:Serie)
REQUIRE s.id IS UNIQUE;

// ACTORS
CREATE CONSTRAINT actor_id_unique
IF NOT EXISTS
FOR (a:Actor)
REQUIRE a.id IS UNIQUE;

// DIRECTORS
CREATE CONSTRAINT director_id_unique
IF NOT EXISTS
FOR (d:Director)
REQUIRE d.id IS UNIQUE;

// GENRES
CREATE CONSTRAINT genre_name_unique
IF NOT EXISTS
FOR (g:Genre)
REQUIRE g.name IS UNIQUE;

// ============================
// MOVIES
// ============================

CREATE
(m1:Movie {id: 101, title: "Inception"}),
(m2:Movie {id: 102, title: "Interstellar"}),
(m3:Movie {id: 103, title: "The Matrix"}),
(m4:Movie {id: 104, title: "Gladiator"}),
(m5:Movie {id: 105, title: "The Dark Knight"});

// ============================
// SERIES
// ============================

CREATE
(s1:Serie {id: 201, title: "Breaking Bad"}),
(s2:Serie {id: 202, title: "Stranger Things"}),
(s3:Serie {id: 203, title: "The Witcher"}),
(s4:Serie {id: 204, title: "Game of Thrones"}),
(s5:Serie {id: 205, title: "The Office"});

// ============================
// GENRES
// ============================

CREATE
(g1:Genre {name: "Sci-Fi"}),
(g2:Genre {name: "Drama"}),
(g3:Genre {name: "Action"}),
(g4:Genre {name: "Fantasy"}),
(g5:Genre {name: "Comedy"});

// ============================
// GENRES
// ============================

CREATE
(g1:Genre {name: "Sci-Fi"}),
(g2:Genre {name: "Drama"}),
(g3:Genre {name: "Action"}),
(g4:Genre {name: "Fantasy"}),
(g5:Genre {name: "Comedy"});

// ============================
// DIRECTORS
// ============================

CREATE
(d1:Director {id: 401, name: "Christopher Nolan"}),
(d2:Director {id: 402, name: "Lana Wachowski"}),
(d3:Director {id: 403, name: "Ridley Scott"});

MATCH
(a1:Actor {id: 301}), (m1:Movie {id: 101}),
(a2:Actor {id: 302}), (m3:Movie {id: 103}),
(a3:Actor {id: 303}), (s1:Serie {id: 201}),
(a4:Actor {id: 304}), (s3:Serie {id: 203}),
(a5:Actor {id: 305}), (m2:Movie {id: 102})
CREATE
(a1)-[:ACTED_IN]->(m1),
(a2)-[:ACTED_IN]->(m3),
(a3)-[:ACTED_IN]->(s1),
(a4)-[:ACTED_IN]->(s3),
(a5)-[:ACTED_IN]->(m2);

MATCH
(d1:Director {id: 401}),
(d2:Director {id: 402}),
(d3:Director {id: 403}),
(m1:Movie {id: 101}),
(m2:Movie {id: 102}),
(m3:Movie {id: 103}),
(m4:Movie {id: 104})
CREATE
(d1)-[:DIRECTED]->(m1),
(d1)-[:DIRECTED]->(m2),
(d2)-[:DIRECTED]->(m3),
(d3)-[:DIRECTED]->(m4);

MATCH
(d1:Director {id: 401}),
(d2:Director {id: 402}),
(d3:Director {id: 403}),
(m1:Movie {id: 101}),
(m2:Movie {id: 102}),
(m3:Movie {id: 103}),
(m4:Movie {id: 104})
CREATE
(d1)-[:DIRECTED]->(m1),
(d1)-[:DIRECTED]->(m2),
(d2)-[:DIRECTED]->(m3),
(d3)-[:DIRECTED]->(m4);

MATCH
(m1:Movie {id: 101}), (g1:Genre {name: "Sci-Fi"}),
(m2:Movie {id: 102}), (g2:Genre {name: "Drama"}),
(m3:Movie {id: 103}), (g1:Genre {name: "Sci-Fi"}),
(s1:Serie {id: 201}), (g2:Genre {name: "Drama"}),
(s5:Serie {id: 205}), (g5:Genre {name: "Comedy"})
CREATE
(m1)-[:IN_GENRE]->(g1),
(m2)-[:IN_GENRE]->(g2),
(m3)-[:IN_GENRE]->(g1),
(s1)-[:IN_GENRE]->(g2),
(s5)-[:IN_GENRE]->(g5);

MATCH (n) RETURN n;
