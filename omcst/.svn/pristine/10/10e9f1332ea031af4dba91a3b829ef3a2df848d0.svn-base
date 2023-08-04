-- 23.02.08
-- KJE
-- 신규 스키마 생성 (opmv : OPenMinds Vacation)
-- omcst 스키마에 있는 테이블을 테이블명만 변경하여 구조/데이터 복사해온다. 
Create Table opmv.program_info ( select * from omcst.program_info );
Create Table opmv.menu ( select * from omcst.lettnmenuinfo );


-- 23.02.01
-- KJE
-- 메뉴 테이블에 use_yn 컬럼 추가
ALTER TABLE `omcst`.`lettnmenuinfo` 
ADD COLUMN `USE_YN` VARCHAR(1) NULL ;

-- 23.02.08
-- 메뉴조회
WITH RECURSIVE CTE AS (
	/* 대메뉴 지정 */
    SELECT 1 AS MENU_LV, MENU_NM,MENU_NO, UPPER_MENU_NO
    ,PROGRM_FILE_NM
    FROM lettnmenuinfo
    WHERE UPPER_MENU_NO = 0
    AND USE_YN = 'Y'
    
    UNION ALL
    
    SELECT B.MENU_LV + 1 AS MENU_LV
    ,A.MENU_NM
    ,A.MENU_NO
    ,A.UPPER_MENU_NO
    ,A.PROGRM_FILE_NM
    FROM lettnmenuinfo A
    INNER JOIN CTE B ON A.UPPER_MENU_NO = B.MENU_NO
)
SELECT A.MENU_LV,A.MENU_NM,A.MENU_NO
,A.UPPER_MENU_NO
,A.PROGRM_FILE_NM
,(SELECT URL FROM lettnprogrmlist P
WHERE P.PROGRM_FILE_NM = A.PROGRM_FILE_NM) AS URL
,B.AUTHOR_CODE
FROM CTE A 
LEFT OUTER JOIN 
LETTNMENUCREATDTLS B
ON A.MENU_NO = B.MENU_NO
WHERE B.AUTHOR_CODE = (SELECT C.AUTHOR_CODE 
						 from LETTNEMPLYRSCRTYESTBS C
						WHERE C.SCRTY_DTRMN_TRGET_ID = 'USRCNFRM_00000000000')
ORDER BY MENU_NO
;

-- 23.04.17
-- 게시판생성관리 커뮤니티/동호회 정보 추가
ALTER TABLE `omcst`.`lettnbbsmaster` 
ADD COLUMN `TRGET_TYPE` CHAR(6) NOT NULL AFTER `LAST_UPDT_PNTTM`;

insert into omcst.lettccmmndetailcode values('COM006','BBSB01','시스템','시스템','Y',now(),'SYSTEM',now(),'SYSTEM');



