-- ## index

-- 확인
show index from infrMember;

-- 생성
create index infrMemberIndex on infrMember(ifmmName);
create index infrMemberIndex on infrMember(ifmmName, ifmmNameEng);
create index infrMemberIndex on infrMember(ifmmName asc, ifmmNameEng desc);

-- 삭제
alter table infrMember drop index infrMemberIndex;

-- 생성2
alter table infrMember add index infrMemberIndex(ifmmName asc);

-- view
create view infrMemberView
AS
	SELECT
		a.ifmmSeq
		,a.ifmmId
		,a.ifmmName 
		,a.ifmmClassificationCd
	FROM
		infrMember a
;

select * from infrMemberView;

alter view infrMemberView
AS
	SELECT
		a.ifmmSeq
		,a.ifmmId
		,a.ifmmName 
		,a.ifmmClassificationCd
        , b.ifmaZipcode
	FROM
		infrMember a
        left join infrMemberAddress b on b.ifmaDelNy = 0 and b.ifmaDefaultNy = 1 and b.ifmmSeq = a.ifmmSeq
;

drop view infrMemberView;

show global variables like 'log_bin_trust_function_creators';

select getCodeGroupName(2);
select getCodeName(1,2);
select getMember(1);
select getItemName(1);
select getEmailFull(1);