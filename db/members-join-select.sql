use d20RubyTools_development;
select
	m.id, r.name, u.username, m.is_online, m.created_at, m.updated_at
from
	members m
inner join
	users u
		on m.user_id = u.id
inner join
	rooms r
		on m.room_id = r.id;
