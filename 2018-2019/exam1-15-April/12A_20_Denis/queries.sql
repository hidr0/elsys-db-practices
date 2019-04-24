use a;

select p.name as 'Name of winner' from Person p right join Battle b on p.id = b.winner_id;
select h.name as 'Name of House' from Person p right join Battle b on p.id = b.loser_id left join House h on h.id = p.house_id;
select (select p.name as 'Name of winner'from Battle b join Person p on b.winner_id = p.id) as a,
(select p.name as 'Name of loser' from Battle b join Person p on b.loser_id = p.id) as b; 
