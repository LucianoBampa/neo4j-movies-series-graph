// Usuários que assistiram filmes de Sci-Fi
MATCH (u:User)-[:WATCHED]->(m:Movie)-[:IN_GENRE]->(g:Genre {name: "Sci-Fi"})
RETURN u.name, m.title;

// Filmes mais bem avaliados
MATCH (u:User)-[w:WATCHED]->(m:Movie)
RETURN m.title, avg(w.rating) AS media
ORDER BY media DESC;
, m.title;
