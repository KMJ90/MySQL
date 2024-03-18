/* set_operators */

-- [ union ] : 두 개 이상의 select문의 결과를 결합하여 중복된 레코드를 제거 후 반환
select
	menu_code,
	menu_name,
	menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	category_code = 10
union
    
select
	menu_code,
	menu_name,
	menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_price < 9000;
    
-- [ union all ] : 중복된 레코드를 제거하지 않고 모두 반환
select
	menu_code,
	menu_name,
	menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	category_code = 10
union all
    
select
	menu_code,
	menu_name,
	menu_price,
    category_code,
    orderable_status
from
	tbl_menu
where
	menu_price < 9000;
    
-- [ intersect ] : 두 select문의 결과 중 공통되는 레코드만을 반환
-- MYSQL은 제공하지 않는다. 하지만 inner join 또는 in 연산자 활용해서 구현가능
-- [ inner join ] 이용
select
	a.menu_code,
	a.menu_name,
	a.menu_price,
    a.category_code,
    a.orderable_status
from
	tbl_menu a
inner join (select
				menu_code,
                menu_name,
                menu_price,
                category_code,
                orderable_status
			from
				tbl_price
			where
				menu_price < 9000) b on (a.menu_code = b.menu_code)
where
	a.category_code = 10;
    
-- [ in ] 이용
select
	menu_code,
    menu_name,
    menu_price,
    categpry_code,
    orderable_status
from
	tbl_menu
where
	category_code = 10 and
    menu_code in (select
						menu_code
					from
						tbl_menu
					where
						menu_price < 9000);
                        
-- [ minus ] : 첫번째 select문의 결과에서 두번째 select문의 결과가 포함되는 레코드를 제외하고 반환
-- MySQL은 minus를 제공하지 않음, left join을 활용해서 구현하는 것은 가능하다
select
	a.menu_code,
    a.menu_name,
    a.menu_price,
    a.categpry_code,
    a.orderable_status,
    b.menu_code
from
	tbl_menu
left join (select
				menu_code,
				menu_name,
				menu_price,
				category_code,
				orderable_status
			from
				tbl_menu
			where
				menu_price < 9000) b on (a.menu_code = b.menu_code);
where
	b.menu_code is null and
    a.category_code = 10;