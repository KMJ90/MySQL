-- [ join ]
-- 두 개 이상의 테이블을 관련있는 컬럼을 통해 결합하는데 사용된다

-- 컬럼 또는 테이블에 별칭을 달아줄 수 있다. 이러한 별칭을 alias라고 한다
-- 별칭에 띄어쓰기나 특수기호가 없다면 홀따옴표(')와 as는 생략 가능하다
select
	menu_code as 'code',
	menu_name as name,
	menu_price as 'price'
from
	tbl_menu
order by price;

select
	category_code,
    menu_name
from
	-- tbl_menu as a
	tbl_menu a  -- 별칭 정할때 as 생략가능
order by
	a.category_code,
	a.menu_name;
    
-- [ inner join ]
-- 두 테이블의 교집합을 반환하는 SQL JOIN 유형

-- [ ON을 활용한 JOIN ]
-- 컬럼명이 같거나 다를 경우 on으로 서로 연관있는 컬럼에 대한 조건을 작성하여 join
select
	a.menu_name,
    b.category_name
from
	tbl_menu a
inner join tbl_category b on a.caetegory_code = b.category_code;  -- inner 생략가능

-- [ using을 활용한 join ]
-- 컬럼명이 같을 경우 using으로 서로 연관있는 컬럼에 대한 조건을 작성하여 join
select
	a.menu_naem,
    b.category_name
from
	tbl_menu a
inner join tbl_category b using (category_code); -- 서로 같은 것을 매칭시켜줌 / using이 on같은 역할을 함

-- [ left join ]
-- 왼쪽 테이블의 모든 레코드와 오른쪽 테이블에서 일치하는 레코드를 반환하는 SQL JOIN 유형
select
	a.category_name,
    b.menu_name
from
	tbl_category a  -- 왼쪽 테이블 / 모든 레코드 결과가 나옴
left join tbl_menu b on a.category_code = b.category_code;  -- 오른쪽 테이블 / 매칭되는게 없으면 null값 출력

-- [ right join ]
-- 오른쪽 테이블의 모든 레코드와 왼쪽 테이블에서 일치하는 레코드를 반환하는 SQL JOIN유형
select
	a.menu_name,
    b.category_name
from
	tbl_menu a
right join tbl_category b on a.category_code = b.category_code;

-- [ cross join ]
-- 두 테이블의 모든 가능한 조합을 반환하는 SQL JOIN 유형
select
	a.menu_name,
    b.category_name
from
	tbl_menu a
cross join tbl_category b;

-- [ self join ]
-- 같은 테이블 내에서 행과 행 사이의 관계를 찾기 위해 사용되는 SQL JOIN 유형
-- 카테고리별 대분류 확인을 위한 self join 조회
select
	a.category_name,
    b.category_name
from
	tbl_category a
join tbl_category b on a.ref_category_code = b.category_code  -- ref_category_code가 b.category_code를 참조함
where a.ref_category_code is not null;  -- 조건으로 null값은 출력되지 않음

-- [ join 알고리즘 ] (중첩 반복문과 비슷함)
-- 1. nested loop join
-- 큰 테이블에 각 행에 대해 작은 테이블을 반복적으로 검색하며, 조인 조건에 맞는 행을 찾는다
-- 인덱스가 잘 구성되어 있는 작은 테이블에 유리하며, 전체 행을 스캔할 필요가 없을 때 효율적이다
-- 결론, 두 테이블 중 하나가 상대적으로 작을 때 효과적이다
select /* + no_hash_join(a) */
	a.menu_name,
    b.catrgory_name
from
	tbl_menu a
join tbl_category b on a.category_code = b.category_code;

-- 2. hash join
-- 이 방식은 두 테이블이 모두 크고, 테이블 간 등가 조인(equal join)이 일어날 때 효과적이다
-- 먼저 한 테이블의 데이터를 읽어 해시 테이블을 생성하고, 다른 테이블을 읽으며 해시 테이블과
-- 매칭되는 데이터를 찾는다
select /* + hash_join(a) */  -- 주석처럼 보이지만 실제로 SQL힌트절로 작동한다
	a.menu_name,             -- 'a'라는 별칭을 가진 테이블에 대해 해시 조인 사용을 지시
    b.category_name
from
	tbl_menu a
join tbl_category b on a.category_code = b.category_code;