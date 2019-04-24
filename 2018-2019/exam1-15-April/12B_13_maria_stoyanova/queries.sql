select p.name from person as p
inner join battle as b on b.winner_id = p.id
group by p.name ;

select h.name from house as h
inner join person as p on p.house_id = h.id
inner join battle as b on b.winner_id = p.id
group by h.name;

