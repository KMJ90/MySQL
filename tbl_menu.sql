SELECT * FROM menudb.tbl_menu;
select
	*
from
	tbl_menu;
select 6 + 3;
select 6 * 3;
select 6 / 3;
select 6 % 3;

select now();
select concat('홍.','','길동');

select concat('홍.','','길동') AS name;
select concat('홍.','','길동') AS 'FULL name';

select
	menu_code,
	menu_name,
	menu_price
from
    tbl_menu
order by  -- 오름차순정렬 asc
    menu_price asc;
    
select
	menu_code,	
	menu_name,
	menu_price
from
	tbl_menu
order by  -- 내림차순정렬 desc
	menu_price desc;
    
select
    menu_code,
    menu_name,
    menu_price
from
    tbl_menu
order by
    menu_price desc,  -- 내림차순
    menu_name asc;  -- 오름차순
    
select
	menu_code,
	menu_price,
	menu_name * menu_price
from
	tbl_menu
order by
	menu_code * menu_price;
    
-- field : 맨왼쪽의 값과 오른쪽의 값을 비교함
select field('A','A','B','C');  -- A 출력됨
select field('B','A','B','C');  -- B 출력됨

select
	field(orderable_status, 'N', 'Y')  -- N은 1로 반환, Y는 2로 반환
from
	tbl_menu;
    
select
	menu_name,  -- 출력될 속성
	orderable_status  -- 출력될 속성
from
	tbl_menu
order by field(orderable_status, 'N', 'Y');  -- N은 1로 반환, Y는 2로 반환

select
	category_code,
	category_name,
	ref_category_code
from
	tbl_category
order by
	-- ref_category_code; - 오름차순 시 null값이 가장 위에 나타남(default)
    ref_category_code is null asc;  -- asc 생략 가능 - is null : null값을 가장 밑으로 내림

select
    category_code,
    category_name,
    ref_category_code
from
    tbl_category
order by  -- 정렬할 때 사용
	-- ref_category_code desc;  -- null값이 아래에 있는것이(defualt)
	ref_category_code is null desc,  -- 내림차순 시 null값이 가장 위로 온다 
    ref_category_code desc;
select
	menu_name,
	menu_price,
	orderable_status
from
	tbl_menu
where
	orderable_status = 'Y'; -- Y값만 출력

select
	menu_name,
	menu_price,
	order_status
from
	tbl_menu
where
	menu_price = 13000;
    
select
	menu_name,
	menu_price,
	order_status
from
	tbl_menu
where
	orderable_status <> 'Y';  -- <> : 같지않은 것을 출력
	-- orderable_status != 'Y';  -- != : 같지않은 것을 출력
    
select
	menu_code,
    menu_name,
    menu_price
from
	tbl_menu
where
	menu_price > 20000;  -- 20000원 이상인 메뉴 검색
    
-- [ AND 연산자 ] --> true : 1 , false : 0
select 1 and 1;  -- 1
select 1 and 0, 0 and 1, 0 and 0, 0 and null;
select 1 and null, null and null;  -- 둘다 null 반환

select
	menu_name,
	menu_price,
	category_code,
    order_status
from
	tbl_nenu
where
	orderable_status = 'Y' and
    category_code = 10;
    
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
		tbl_menu
where
	menu_price > 5000 and
    category_code = 10;
    
-- [ OR 연산자 ] --> true : 1 , false : 0
select 1 or 1, 1 or 0, 0 or 1; -- 모두 true
select 0 or 0;
select 1 or null, 0 or null, null or null; -- 1, null, null

select
	menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	orderable_status = 'Y' or
    category_code = 10
order by  -- 오름차순 정렬시 사용
	category_code;
    
-- 대/소 비교 연산자 사용
select
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_price > 5000 or
    category_code = 10;
    
select 1 or 0 and 0;
select (1 or 0) and 0;  -- false(0)

select
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
where
	category_code = 4 or
	menu_price = 9000 and
	menu_code > 10;
    -- category_code = 4 or (menu_price = 9000 and menu_code > 10);
    
select
	menu_name,
	menu_price,
    category_code
from
	tbl_menu
where
	menu_price >= 10000 and
	menu_price <= 25000
order by
	menu_price;
    
select
	menu_name,
    menu_price,
    category_code
from
	tbl_menu
where
	menu_price between 10000 and 25000
order by
	menu_price;
    
select
	menu_name,
    menu_price,
    category_code
from
	tbl_menu
where
	menu_price not between 10000 and 25000  -- 만원에서 2만5천원 사이를 뺀(제외한) 출력
order by
	menu_price;
    
select
	menu_name,
	menu_price
from
	tbl_menu
where
	menu_name like '%마늘%';  -- '%' : 0개 이상의 임의의 문자 / '_' : 1개의 임의의 문자
	-- 이름에 마늘이 들어간 메뉴를 검색

select
	menu_code,
	menu_name,
	menu_price,
	category_code,
	orderable_status
from
	tbl_menu
where
	menu_price > 5000 and
	category_code = 10 and
	menu_name like '%갈치%';
    
select
	menu_name,
    menu_price
from
	tbl_menu
where
	menu_name not like '%마늘%' -- 이름에 마늘이 들어간 메뉴 출력 안함
order by
	menu_name;
    
select
	menu_name,
    category_code
from
	tbl_menu
where
	category_code = 4 or
	category_code = 5 or
	category_code = 6
order by
	category_code;
    
select
	menu_name,
    category_code
from
	tbl_menu
where
	category_code in (4, 5, 6) -- category_code 가 4,5,6 인것만 출력
    -- category_code not in (4, 5, 6) -- 부정표현
order by
	category_code;
    
select
	category_code,
	category_name,
    ref_category_code
from
	tbl_category
where
	-- ref_category_code is null; -- null값 인것만 출력
    ref_category_code is not null; -- null값이 출력되지 않음