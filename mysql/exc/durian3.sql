select
a.ifcgSeq
, a.ifcgName
, b.ifcdSeq
, b.ifcdName
, b.ifcdOrder
, b.ifcdUseNy
, b.ifcdDelNy
from infrCodeGroup a
	left join infrCode b on b.ifcgSeq = a.ifcgSeq
where 1=1
	and a.ifcgDelNy = 0
    and a.ifcgUseNy = 1
    and b.ifcdDelNy = 0
    and b.ifcdUseNy = 1
    and a.ifcgSeq = 3
order by
	a.ifcgSeq asc
    -- a.ifcgSeq desc
    , b.ifcdOrder
    -- , b.ifcdOrder desc
;

select 
a.ifcgSeq
, a.ifcgName
, b.ifcdSeq
, b.ifcdName
, b.ifcdOrder
, b.ifcdUseNy
, b.ifcdDelNy 
from infrcode b
	left join infrCodeGroup a on b.ifcgSeq = a.ifcgSeq
where 1=1
	and a.ifcgDelNy = 0
    and a.ifcgUseNy = 1
    and b.ifcdDelNy = 0
    and b.ifcdUseNy = 1    
order by
	a.ifcgSeq asc
    -- a.ifcgSeq desc
    -- , b.ifcdOrder
    , b.ifcdOrder desc
;