-- 상품 상세정보

select
	a.shimName
    , (select ifcdName from infrcode where ifcdSeq = a.shimBrandCd) as manufacture
    , a.regDateTime
from shmlitem a
where 1=1
    and a.DelNy = 0
;

select
	a.shimName
    , (select ifcdName from infrcode where ifcdSeq = a.shimBrandCd) as manufacture
    , a.regDateTime
    , (select shcgiName from shmlcategoryentry where shmlcategoryentry.shcgiSeq = b.shidEntryCode) as entryName
    , b.shidContents
from shmlitem a
left join shmlitemdesc b on b.shimSeq = a.shimSeq
where 1=1
	and b.DelNy = 0
    and a.DelNy = 0
;

-- 상품 상세정보 끝

select
	concat("[",a.ifmaZipcode,"] ",a.ifmaAddress1," ",a.ifmaAddress2)
    , b.ifmmName
from
	infrmemberaddress a
left join infrmember b on b.ifmmSeq = a.ifmmSeq;
