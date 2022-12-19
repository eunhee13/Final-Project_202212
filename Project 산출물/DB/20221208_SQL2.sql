DROP TABLE "MA_EMP" CASCADE CONSTRAINTS;
DROP TABLE "MA_CODE_EMP" CASCADE CONSTRAINTS;
DROP TABLE "MA_DEPT" CASCADE CONSTRAINTS;
DROP TABLE "MA_JIKUP" CASCADE CONSTRAINTS;
DROP TABLE "MA_EMP_PRIVATE" CASCADE CONSTRAINTS;
DROP TABLE "MA_USER" CASCADE CONSTRAINTS;
DROP TABLE "HR_CALCPAY" CASCADE CONSTRAINTS;
DROP TABLE "MA_BOARD" CASCADE CONSTRAINTS;
DROP TABLE "MA_RE_BOARD" CASCADE CONSTRAINTS;
DROP TABLE "HR_PAYREPORT" CASCADE CONSTRAINTS;
DROP TABLE "HR_PAYLIST" CASCADE CONSTRAINTS;
DROP TABLE "HR_PCALCPAY" CASCADE CONSTRAINTS;
DROP TABLE "HR_DCALCPAY" CASCADE CONSTRAINTS;
DROP TABLE "MA_BIZAREA" CASCADE CONSTRAINTS;
DROP TABLE "MA_COMPANY" CASCADE CONSTRAINTS;
DROP TABLE "HR_AMPAYMENT" CASCADE CONSTRAINTS;
DROP TABLE "HR_CDPAYMENT" CASCADE CONSTRAINTS;


  -- ������� ���̺� ���� : MA_EMP
CREATE TABLE MA_EMP
    ( NO_EMP        VARCHAR2(20)
    , NM_EMP        VARCHAR2(20)   NOT NULL
    , ENTER_DATE    DATE           NOT NULL
    , BIRTH_DATE    DATE           NOT NULL
    , RETIRE_DATE   DATE
    , CD_EMP        VARCHAR2(20)   DEFAULT '001' NOT NULL
    , CD_DEPT       VARCHAR2(20)   NOT NULL
    , CD_JIK        VARCHAR2(20)   NOT NULL
    , PRIMARY KEY(NO_EMP) );



-- ���������ڵ� ���̺� ���� : MA_CODE_EMP
CREATE TABLE MA_CODE_EMP
    (    CD_EMP     VARCHAR2(20)    DEFAULT '001'
    , NM_CD_EMP     VARCHAR2(20)    NOT NULL
    , PRIMARY KEY (CD_EMP) );



-- �μ��ڵ� ���̺� ���� : MA_DEPT
CREATE TABLE MA_DEPT
    (CD_DEPT    VARCHAR2(20)
    , NM_DEPT   VARCHAR2(30)    NOT NULL
    , PRIMARY KEY (CD_DEPT) );



-- �����ڵ� ���̺� ���� : MA_JIKUP
CREATE TABLE MA_JIKUP
    (CD_JIK     VARCHAR2(20)
    , NM_JIK    VARCHAR2(30)    NOT NULL
    , PRIMARY KEY(CD_JIK)   );


-- �������� ���̺� ���� : MA_EMP_PRIVATE
CREATE TABLE MA_EMP_PRIVATE
    ( NO_EMP  VARCHAR2(20)             NOT NULL
    , EMAIL     VARCHAR2(50)
    , NM_ADDR   VARCHAR2(200)
    , PHONE     VARCHAR2(50)     NOT NULL
    , NO_RES    VARCHAR2(20)     NOT NULL
    , FOREIGN KEY(NO_EMP)   REFERENCES MA_EMP (NO_EMP)  );


-- ��������� ���̺� ���� : MA_USER
CREATE TABLE MA_USER
    (NO_EMP VARCHAR2(20)               NOT NULL
    , USER_ID   VARCHAR2(50)    NOT NULL
    , USER_PWD  VARCHAR2(50)    NOT NULL

    , FOREIGN KEY(NO_EMP) REFERENCES MA_EMP (NO_EMP)    );


-- �޿����� ���̺� ���� : HR_CALCPAY
CREATE TABLE HR_CALCPAY
    (NO_EMP VARCHAR2(20)                NOT NULL
    , YM    VARCHAR2(20)          NOT NULL
    , CD_PAY VARCHAR2(20)         NOT NULL
    , AM_TOTPAY NUMBER
    , CD_DEDUCT     VARCHAR2(20)  NOT NULL
    , AM_TOTDEDUCT  NUMBER
    , FOREIGN KEY(NO_EMP) REFERENCES MA_EMP (NO_EMP)    );

-- �������� ���̺�  ���� : MA_BOARD
CREATE TABLE MA_BOARD
    (B_NO   NUMBER
    , NO_EMP    VARCHAR2(20)          NOT NULL
    , SUBJECT   VARCHAR2(50)    NOT NULL
    , CONTENT VARCHAR2(3000)
    , REG_DATE  DATE    DEFAULT SYSDATE NOT NULL
    , READCOUNT NUMBER          NOT NULL
    , PRINT_NO NUMBER           NOT NULL
    , PRIMARY KEY (B_NO)
    , FOREIGN KEY(NO_EMP) REFERENCES MA_EMP (NO_EMP) );


-- �������� ��� ���� ���̺� ���� : MA_RE_BOARD
CREATE TABLE MA_RE_BOARD
    (B_NO   NUMBER                 NOT NULL
    , NO_EMP    VARCHAR2(20)              NOT NULL
    , CONTENT   VARCHAR2(3000)     NOT NULL
    , REG_DATE  DATE    DEFAULT SYSDATE  NOT NULL
    , PRINT_LEVEL   NUMBER NOT NULL
    , FOREIGN KEY(B_NO) REFERENCES MA_BOARD(B_NO)
    , FOREIGN KEY(NO_EMP)  REFERENCES MA_EMP(NO_EMP)    );


-- ������� ���̺� ���� : HR_PAYREPORT
CREATE TABLE HR_PAYREPORT
    (CD_PAYREPORT   VARCHAR2(50)    NOT NULL
    , NM_PAYREPORT  VARCHAR2(50)    NOT NULL    );


-- �޿��⺻���� ���̺� ���� : HR_PAYLIST
CREATE TABLE HR_PAYLIST
    (NO_EMP VARCHAR2(20)                   NOT NULL
    , PAY_PER_HOUR      NUMBER
    , PAY_PER_DAY      NUMBER
    , PAY_PER_MONTH      NUMBER
    , PAY_PER_YEAR      NUMBER
    , FOREIGN KEY (NO_EMP) REFERENCES MA_EMP (NO_EMP)   );



-- �����׸� ���̺� ���� : HR_PCALCPAY
CREATE TABLE HR_PCALCPAY
    ( NO_EMP VARCHAR2(20)  NOT NULL
    , YM VARCHAR2(20)       NOT NULL
    , CD_PAY01 VARCHAR2(20)
    , CD_PAY02 VARCHAR2(20)
    , CD_PAY03 VARCHAR2(20)
    , CD_PAY04 VARCHAR2(20)
     , NM_PAY01 VARCHAR2(50)
     , NM_PAY02 VARCHAR2(50)
     , NM_PAY03 VARCHAR2(50)
     , NM_PAY04 VARCHAR2(50)
    , AM_PAY01  NUMBER
    , AM_PAY02  NUMBER
    , AM_PAY03  NUMBER
    , AM_PAY04  NUMBER );

-- �����׸� ���̺� ���� : HR_DCALCPAY
CREATE TABLE HR_DCALCPAY
    ( NO_EMP VARCHAR2(20)  NOT NULL
    , YM VARCHAR2(20)       NOT NULL
    , CD_DEDUCT01 VARCHAR2(20)
    , CD_DEDUCT02 VARCHAR2(20)
    , CD_DEDUCT03 VARCHAR2(20)
    , CD_DEDUCT04 VARCHAR2(20)
     , NM_DEDUCT01 VARCHAR2(50)
     , NM_DEDUCT02 VARCHAR2(50)
     , NM_DEDUCT03 VARCHAR2(50)
     , NM_DEDUCT04 VARCHAR2(50)
    , AM_DEDUCT01  NUMBER
    , AM_DEDUCT02  NUMBER
    , AM_DEDUCT03  NUMBER
    , AM_DEDUCT04  NUMBER );


CREATE TABLE MA_BIZAREA
    (CD_BIZAREA       VARCHAR2(20)    NOT NULL
     , NM_BIZAREA     VARCHAR2(20)    NOT NULL
);

CREATE TABLE MA_COMPANY
    (CD_COMPANY       VARCHAR2(20)    NOT NULL
     , NM_COMPANY     VARCHAR2(20)    NOT NULL
);


-- MA_EMP ���̺� FK ���� : CD_EMP(FK)
ALTER TABLE MA_EMP
ADD CONSTRAINT FK_MA_EMP_01 FOREIGN KEY (CD_EMP)
REFERENCES MA_CODE_EMP (CD_EMP) ;



-- MA_EMP ���̺� FK ���� : CD_DEPT(FK)
ALTER TABLE MA_EMP
ADD CONSTRAINT FK_MA_EMP_02 FOREIGN KEY (CD_DEPT)
REFERENCES MA_DEPT (CD_DEPT) ;

-- MA_EMP ���̺� FK ���� : CD_JIK(FK)
ALTER TABLE MA_EMP
ADD CONSTRAINT FK_MA_EMP_03 FOREIGN KEY (CD_JIK)
REFERENCES MA_JIKUP (CD_JIK) ;





-- HR_CALCPAY ���̺��� YM �÷� PK�� ����
ALTER TABLE HR_CALCPAY ADD PRIMARY KEY (YM);


-- HR_PCALCPAY, HR_DCLACPAY ���̺��� YM�� FK�� ����, HR_CALCPAY ����
ALTER TABLE HR_PCALCPAY
ADD CONSTRAINT FK_HR_PCALCPAY_01 FOREIGN KEY (YM)
REFERENCES HR_CALCPAY (YM);

ALTER TABLE HR_DCALCPAY
ADD CONSTRAINT FK_HR_DCALCPAY_01 FOREIGN KEY (YM)
REFERENCES HR_CALCPAY (YM);

ALTER TABLE HR_PCALCPAY
ADD CONSTRAINT FK_HR_PCALCPAY_02 FOREIGN KEY (NO_EMP)
REFERENCES
 MA_EMP(NO_EMP) ;

ALTER TABLE HR_DCALCPAY
ADD CONSTRAINT FK_HR_DCALCPAY_02 FOREIGN KEY (NO_EMP)
REFERENCES MA_EMP (NO_EMP) ;

-- �÷� �̸� ����
ALTER TABLE MA_BOARD RENAME COLUMN NO_EMP TO GROUP_NO;
-- GROUP_NO �÷� ����
ALTER TABLE MA_BOARD DROP COLUMN GROUP_NO;
-- (READCOUNT, PRINT_NO)NULL ���� ����, GROUP_NO �÷� �߰�
ALTER TABLE MA_BOARD MODIFY READCOUNT NUMBER NULL;
ALTER TABLE MA_BOARD MODIFY PRINT_NO NUMBER NULL;
ALTER TABLE MA_BOARD ADD GROUP_NO NUMBER;

-- ���� ����, ���� ���̺� 3�� ����
DROP TABLE "HR_PCALCPAY" CASCADE CONSTRAINTS;
DROP TABLE "HR_DCALCPAY" CASCADE CONSTRAINTS;
DROP TABLE "HR_CALCPAY" CASCADE CONSTRAINTS;

-- ����/�����׸��� �ڵ尡 �ִ� ���̺� NM~ , CD~
CREATE TABLE HR_CDPAYMENT       (
CD_PAY01    VARCHAR2(50)
,  CD_PAY02    VARCHAR2(50)
,  CD_PAY03    VARCHAR2(50)
,  CD_PAY04    VARCHAR2(50)
,  CD_PAY05    VARCHAR2(50)
,  CD_PAY06    VARCHAR2(50)
,  CD_PAY07    VARCHAR2(50)
,  CD_PAY08    VARCHAR2(50)
, NM_PAY01      VARCHAR2(50)
, NM_PAY02      VARCHAR2(50)
, NM_PAY03      VARCHAR2(50)
, NM_PAY04      VARCHAR2(50)
, NM_PAY05      VARCHAR2(50)
, NM_PAY06      VARCHAR2(50)
, NM_PAY07      VARCHAR2(50)
, NM_PAY08      VARCHAR2(50)

,  CD_DEDUCT01    VARCHAR2(50)
,  CD_DEDUCT02    VARCHAR2(50)
,  CD_DEDUCT03    VARCHAR2(50)
,  CD_DEDUCT04    VARCHAR2(50)
,  CD_DEDUCT05    VARCHAR2(50)
,  CD_DEDUCT06    VARCHAR2(50)
,  CD_DEDUCT07   VARCHAR2(50)
,  CD_DEDUCT08    VARCHAR2(50)
, NM_DEDUCT01      VARCHAR2(50)
, NM_DEDUCT02      VARCHAR2(50)
, NM_DEDUCT03      VARCHAR2(50)
, NM_DEDUCT04      VARCHAR2(50)
, NM_DEDUCT05      VARCHAR2(50)
, NM_DEDUCT06      VARCHAR2(50)
, NM_DEDUCT07      VARCHAR2(50)
, NM_DEDUCT08      VARCHAR2(50) ) ;


-- ����/�����׸�ݾ��� �ִ� ���̺�
CREATE TABLE HR_AMPAYMENT (
NO_EMP VARCHAR2(20) NOT NULL
, YM VARCHAR2(20) NOT NULL
, AM_PAY01  NUMBER
, AM_PAY02  NUMBER
, AM_PAY03  NUMBER
, AM_PAY04  NUMBER
, AM_PAY05  NUMBER
, AM_PAY06  NUMBER
, AM_PAY07  NUMBER
, AM_PAY08  NUMBER
, AM_DEDUCT01   NUMBER
, AM_DEDUCT02   NUMBER
, AM_DEDUCT03   NUMBER
, AM_DEDUCT04   NUMBER
, AM_DEDUCT05   NUMBER
, AM_DEDUCT06   NUMBER
, AM_DEDUCT07   NUMBER
, AM_DEDUCT08   NUMBER
, PRIMARY KEY(NO_EMP) );



--------------------------------------------
-- �׽�Ʈ ������ �μ�Ʈ
---------------------------------------------
-- �������� ������ �ֱ�
INSERT INTO MA_CODE_EMP VALUES('000','������');
INSERT INTO MA_CODE_EMP VALUES('001','����');
INSERT INTO MA_CODE_EMP VALUES('002','����');
INSERT INTO MA_CODE_EMP VALUES('099','���');

-- ����
INSERT INTO MA_JIKUP VALUES('000','������');
INSERT INTO MA_JIKUP VALUES('001','����');
INSERT INTO MA_JIKUP VALUES('002','�λ���');
INSERT INTO MA_JIKUP VALUES('003','�����̻�');
INSERT INTO MA_JIKUP VALUES('004','���̻�');
INSERT INTO MA_JIKUP VALUES('005','�̻�');
INSERT INTO MA_JIKUP VALUES('006','����');
INSERT INTO MA_JIKUP VALUES('007','����');
INSERT INTO MA_JIKUP VALUES('008','����');
INSERT INTO MA_JIKUP VALUES('009','�븮');
INSERT INTO MA_JIKUP VALUES('010','����');
INSERT INTO MA_JIKUP VALUES('011','���');

-- �μ�
INSERT INTO MA_DEPT VALUES('000','������');
INSERT INTO MA_DEPT VALUES('001','�λ��');
INSERT INTO MA_DEPT VALUES('002','�ѹ���');
INSERT INTO MA_DEPT VALUES('003','ȸ���');
INSERT INTO MA_DEPT VALUES('004','��ȹ��');
INSERT INTO MA_DEPT VALUES('005','������');

--�׽�Ʈ ������(�ý���, ��ö��)
insert into ma_emp values ('system', 'system',sysdate,sysdate,null, '000','000','000');

insert into ma_emp values ('erp001', '��ö��',sysdate,sysdate,null, '001','001','001');
insert into ma_emp_private values('erp001','erperp_sajang01@gmail.com','����� ���۱� īī������Ʈ 102-1502','01012341234','9010101231234');

insert into ma_emp values ('erp002', '�̰���',to_date('20160730','yyyy-mm-dd'),to_date('19991017','yyyy-mm-dd'),null, '001','003','006');
insert into ma_emp_private values ('erp002','erperp_kangin18@gmail.com','����� ���Ǳ� ���丣ī���� 103-122','01013547985','9910171231234');

insert into ma_emp values('erp003', '�����',to_date('20020826','yyyy-mm-dd'),to_date('19850708','yyyy-mm-dd'),null, '001','002','003');
insert into ma_emp_private values('erp003','erperp_son7@gmail.com','����� ������ ��Ʈ�Ѿ���Ʈ 117-017','01013798521','8507081112222');

insert into ma_emp values ('erp004', '���Լ�',to_date('20141008','yyyy-mm-dd'),to_date('19980125','yyyy-mm-dd'),null, '001','005','009');
insert into ma_emp_private values('erp004','erperp_forward09@gmail.com','����� ��õ�� ������ͽ����� 110-1903','01013798521','9801251532692');

-------------------

insert into ma_emp values ('erp005', 'Ȳ����',to_date('19960214','yyyy-mm-dd'),to_date('19720215','yyyy-mm-dd'),null, '001','003','005');
insert into ma_emp_private values('erp005','erperp_eujo16@naver.com','����� ���α� īī������Ʈ 117-415','01045169712','7202151421697');

insert into ma_emp values ('erp006', '�۹α�',to_date('20050108','yyyy-mm-dd'),to_date('19851227','yyyy-mm-dd'),null, '001','004','007');
insert into ma_emp_private values('erp006','erperp_songmk26@gmail.com','����ϵ� ����� �������Ʈ 102-1017','01064581256','8512271784125');

insert into ma_emp values ('erp007', '���ȣ',to_date('20160214','yyyy-mm-dd'),to_date('19970915','yyyy-mm-dd'),null, '001','005','009');
insert into ma_emp_private values('erp007','erperp_goal08@gmail.com','��û���� ���걺 ��ġ����Ʈ 118-1302','01041261005','9709151124879');

insert into ma_emp values ('erp008', '����ȣ',to_date('20010113','yyyy-mm-dd'),to_date('19850402','yyyy-mm-dd'),null, '001','004','008');
insert into ma_emp_private values('erp008','erperp_rocket17@hanmail.net','����� ������ �������Ʈ 115-1061','01091754112','8504021236574');



insert into ma_emp values ('erp009', '���쿵',to_date('20080319','yyyy-mm-dd'),to_date('19811207','yyyy-mm-dd'),null, '001','002','007');
insert into ma_emp_private values('erp009','erperp_scfb25@gmail.com','����� ���α� īī������Ʈ 127-011','01064871523','8112071549782');


insert into ma_emp values ('erp010', 'Ȳ�ι�',to_date('20040708','yyyy-mm-dd'),to_date('19940604','yyyy-mm-dd'),null, '001','004','010');
insert into ma_emp_private values('erp010','erperp_yellowintiger06@gmail.com','����� ��õ�� ��Ʈ�Ѿ���Ʈ 103-1522','01046125547','9406041245665');

insert into ma_emp values ('erp011', 'Ȳ����',to_date('19980629','yyyy-mm-dd'),to_date('19790823','yyyy-mm-dd'),null, '001','004','006');
insert into ma_emp_private values('erp011','erperp_khwangso11@gmail.com','����� ���α� ������ ���Ͼ���Ʈ 109-112','01064971226','7908231332654');



COMMIT;

--�ý��� ������ ���̵� ���
insert into ma_user values ('system', 'system','123');
--��ö�� ������ ���̵� ���
insert into ma_user values ('erp001', 'abc','123');

COMMIT;


--------------------------------------------
-- �����ü���� �����̺� ����
---------------------------------------------

SELECT E.*, U.*
FROM MA_EMP E JOIN MA_USER U
ON E.NO_EMP = U.NO_EMP;

CREATE VIEW TEST_01 AS
SELECT E.NO_EMP, E.NM_EMP, E.ENTER_DATE, E.BIRTH_DATE, E.RETIRE_DATE, E.CD_EMP, E.CD_DEPT, E.CD_JIK
, U.USER_ID, U.USER_PWD
FROM MA_EMP E JOIN MA_USER U
ON E.NO_EMP = U.NO_EMP;

CREATE VIEW MA_EMP_TMP AS
SELECT T1.NO_EMP, T1.NM_EMP, T1.ENTER_DATE, T1.BIRTH_DATE, T1.RETIRE_DATE, T1.CD_EMP, T1.CD_DEPT, T1.CD_JIK
, T1.USER_ID, T1.USER_PWD, EP.EMAIL, EP.NM_ADDR, EP.PHONE, EP.NO_RES
FROM TEST_01 T1 JOIN MA_EMP_PRIVATE EP
ON T1.NO_EMP = EP.NO_EMP ;



