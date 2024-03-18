/* build_in_functions */

-- 1. 문자열 관련 함수
-- ascii : 아스키 코드 값 추출
-- char : 아스키 코드로 문자 추출

select ascii('A'), char(65);

-- bit_lenght : 할당된 비트 크기 반환  -- 1byte = 8bit 
-- char_lenght : 문자열의 길이 반환
-- lenght : 할당된 byte 크기 반환

select bit_length('pie'), char_length('pie'), length('pie');
select 
	menu_name,
    bit_length(menu_name),
    char_length(menu_name),
    length(menu_name)
from
	tbl_menu;
    
-- concat : 문자열을 이어붙임
-- concat ws : 구분자와 함께 문자열을 이어붙임
-- concat_ws(구분자, 문자열1. 문자열2)
select concat('호랑이','기린','판다');
select concat_ws('-','2024','02','23');

-- elt : 해당 위치의 문자열 반환
-- elt(위치, 문자열1, 문자열2)

-- field : 찾을 문자열 위치 반환
-- field"(찾을 문자열, 문자열1, 문자열2...)

-- find_in_set : 찾을 문자열의 위치 반환
