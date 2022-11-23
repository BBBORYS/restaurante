

--trigger

create or replace view prohibicon()
return trigger as $$
declare
mesaocupada int;
begin
select count(*)into mesaocupada from mesas where ID_mesa=new.ID_MESA
if(mesaocupada >=1 ) then
raise exception mesa ocupada 
end if;
return new;
end;
$$
languaje plpgsql
create trigger mesa ocupada por otra persona before insert
on intervenciones for each row
execute procedure prohibicon();
insert into mesaocupada values(6,7,8,9,'INTERVENCION MATRIZ')
