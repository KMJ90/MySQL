/* [ dml ](data manipulation language) */
-- 데이터 조작언어, 테이블에 값을 삽입하거나 수정, 삭제하는 SQL의 한 부분이다

-- 1. [ insert ] : 새로운 행을 추가하는 구문
select * from tbl_menu;
insert into tbl_menu values (null, '바나나해장국', 8500, 4, 'Y');

-- null 허용 가능함(nullable)컬럼이나 auto_increment가 있는 컬럼을 제외하고
-- insert하고 싶은 데이터 컬럼을 지정해서 insert 가능하다
insert into tbl_menu (menu_name, menu_price, category_code, orderable_status)
values ('초콜릿죽', 6500, 7, 'Y');
select * from tbl_menu;
-- 컬럼을 명시하면 insert시 데이터의 순서를 바꾸는 것도 가능하다
insert into tbl_menu( orderable_status, menu_price, menu_name, category_code)
values ('Y', 5800, '파인애플빵', 4);

insert into
	tbl_menu
values
	(null, '참치아이스크림', 1700, 12, 'Y'),
    (null, '멸치아이스크림', 1500, 11, 'Y'),
    (null, '소시지커피맛', 2500, 8, 'Y');

delete from tbl_menu 
where menu_name = '참치아이스크림';
    
-- 2. [ update ] : 테이블에 기록된 컬럼의 값을 수정하는 구문이다
select
	menu_code,
    category_code
from
	tbl_menu
where
	menu_name = '파인애플빵';
    
-- update나 delete시 자기 자신 테이블의 데이터를 사용 시 에러 발생
    
update tbl_menu
set
	category_code = 7
where
	menu_code = 24;
    

update tbl_menu
set
	category_code = 6
where
	menu_code = (select
						tmp.menu_code
					from (select
						menu_code
					from
						tbl_menu
					where
						menu_name = '파인애플빵') tmo
				);    
-- 3. [ delete ] : 테이블의 행을 삭제하는 구문이다

-- limit 활용한 행 삭제
delete from tbl_menu
order by menu_price
limit 2;

-- where절을 활용한 행 삭제
delete from
	tbl_menu
where
	menu_code = 24;
    
-- 전체 행을 지우는 구문
delete from tbl_menu;
-- 세이프 업데이트 모드 비활성화
set SQL_SAFE_UPDATES = 0; 
-- 세이프 업데이트 모드 활성화
set SQL_SAFE_UPDATES = 1; 

-- 4. [ replace ] : insert시 primary key 또는 unique key가 중복이 발생할 수 있다면
--                  replace를 통해 중복 된 데이터를 덮어 쓸 수 있다
insert into tbl_menu values (17, '참기름소주', 5000, 10, 'Y');
replace into tbl_menu values (17, '참기름소주', 5000, 10, 'Y');
replace tbl_menu values (17, '참기름소주', 5000, 10, 'Y');

replace tbl_menu
set menu_code = 2,
	menu_name = '우럭쥬스',
    menu_price = 2000,
    category_code = 9,
    orderable_status = 'N';
