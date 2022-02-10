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

select * from infrmemberaddress;

select
	a.ifmmseq
    , a.ifmmAdminNy
    , a.ifmmName
    , a.ifmmId
    , (select ifcdName from infrcode where a.ifmmGenderCd = ifcdSeq) as 성별
    , a.ifmmDob
    , (select ifcdName from infrcode where a.ifmmSavedCd = ifcdSeq) as 저장기간
    , (select ifcdName from infrcode where a.ifmmMarriageCd = ifcdSeq) as 결혼
    , a.ifmmChildrenNum
    , a.ifmmFavoriteColor
    , a.ifmmEmailConsentNy
    , a.ifmmSmsConsentNy
    , a.ifmmPushConsentNy
    , b.ifmaZipcode
    , b.ifmaAddress1
    , b.ifmaAddress2
    , ifnull(c.ifaoSnsTypeCd,"-") as sns체크
    , ifnull((select ifcdName from infrcode where c.ifaoSnsTypeCd = ifcdSeq),"-") as sns
    , ifnull(c.ifaoUrl,"-") as ifaoUrl
    , d.ifmeEmailFull
    , (select ifcdName from infrcode where f.ifjqQuestionCd = ifcdSeq) as 질문
    , f.ifjqAnswer
    , (select ifcdName from infrcode where h.ifmpTelecomCd = ifcdSeq) as 통신사
    , h.ifmpNumber
    , concat(substring(h.ifmpNumber,1,3),"-",substring(h.ifmpNumber,4,4),"-",substring(h.ifmpNumber,7,4)) as 전화번호보기
    , (select ifnaName from infrnationality where ifnaSeq = g.ifnaSeq) as 국적
    
from infrmember a
	left join infrmemberaddress b on b.ifmaDelNy = 0 and b.ifmaDefaultNy = 1 and b.ifmmSeq = a.ifmmSeq
    left join infrmemberaddressonline c on c.ifaoDelNy = 0 and c.ifaoDefaultNy = 1 and c.ifmmSeq = a.ifmmSeq
    left join infrmemberemail d on d.ifmeDelNy = 0 and d.ifmeDefaultNy = 1 and d.ifmmSeq = a.ifmmSeq
    -- left join infrmemberhobby e on e.ifmhDelNy = 0 and e.ifmhDefaultNy = 1 and e.ifmmSeq = a.ifmmSeq
    left join infrmemberjoinqna f on f.ifjqDelNy = 0 and f.ifmmSeq = a.ifmmSeq
    left join infrmembernationality g on g.ifmnDefaultNy = 1 and g.ifmnDelNy = 0 and g.ifmmSeq = a.ifmmSeq
    left join infrmemberphone h on h.ifmpDelNy = 0 and h.ifmpDefaultNy = 1 and h.ifmmSeq = a.ifmmSeq
where 1=1
	and a.ifmmDelNy = 0
    -- and a.ifmmId like '%xd%'
;

alter table infrmembernationality add ifmnDefaultNy tinyint after ifmnSeq ;