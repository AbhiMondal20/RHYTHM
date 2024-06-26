select * from dba;
select * from discharge
SELECT * FROM [dbo].[dba] WHERE dUSERNAME = 'Administrator' AND dPASSWORD = 'Para@012'
--DROP TABLE billing;

INSERT INTO citymaster (Cityname, distname, state, country, added_by) VALUES ('Kolkata', 'Kolkata', 'West Bengal', 'India', 'Administrator')

Select * FROM docmaster
SELECT docName, fee FROM docmaster WHERE dept = 'Cardiology'
UPDATE citymaster
SET date = CURRENT_TIMESTAMP;

Select * FROM InPatho2324 where rno = '237500'
DELETE FROM citymaster WHERE rno = '237480'
ALTER TABLE servmaster
ADD added_by VARCHAR(255), 
    date DATETIME,
	modify_by VARCHAR(255),
    modify_date DATETIME; 

-- Add the dept column to the end of the table
ALTER TABLE servmaster
ADD dept2 VARCHAR(MAX) NULL;

Select * FROM servmaster where servname = 'K T L'
-- Inserting 'Breast' into dept column
update servmaster set dept = 'Breast Screening' where servname = 'demo8'; 

select * from InPatho2324 where rcno = '35985'
delete from servmaster where servname = 'test2'

ALTER TABLE servmaster
ALTER COLUMN dept VARCHAR(MAX);


drop table registration
ALTER TABLE registration
ADD id INT IDENTITY(1,1) PRIMARY KEY;


SELECT TOP 1 rcno FROM InPatho2324 ORDER BY id DESC

ALTER TABLE registration
DROP COLUMN id;



select * from AdmitCard2324 where regno = '237493'

select * from billingDetails

--Rename Column name 
EXEC sp_rename 'billingDetails.rstatus', 'opid', 'COLUMN';

select * from billing
select * from registration

select * from servmaster where dept = 'Hematolog'
ALTER TABLE billing
ADD opid INT NULL; -- or appropriate data type

ALTER TABLE billing
ALTER COLUMN opid VARCHAR(MAX);




delete from billingDetails
select * from docmaster where srno = '1985';


--DELETE FROM deptmaster;

INSERT INTO docmaster(docregno, docName, sp, fee) VALUES ('Neuro', 'MD004', 'Dr. Sajal Biswas', '700');

SELECT srno, docName, sp, fee FROM docmaster ORDER BY srno DESC
select * from citymaster

SELECT id, rno, pname, servname, billdate, uname 
FROM billing 
WHERE (billdate BETWEEN '2024-03-23' AND '2024-03-24') OR rno = '237482' 
ORDER BY id DESC;


SELECT id, rno, pname, servname, billdate, uname 
FROM billing 
INNER JOIN registration ON billing.rno = registration.rno

SELECT id, rno, pname, servname, billdate, uname FROM billing 
SELECT TOP 1 billno FROM billingDetails ORDER BY id DESC
SELECT * FROM InPatho2324 Where rcno = '35985'

SELECT 
    billing.servname, 
    billing.billno, 
    billing.billdate, 
    MAX(billing.servrate) AS max_servrate 
FROM 
    billing 
WHERE 
    billing.rno = '237507' 
GROUP BY 
    billing.servname, 
    billing.billno, 
    billing.billdate;
	   
select * from billing where rno = '237503'
select * from billingDetails
Select * FROM registration where rno = '237506'


SELECT MAX(b.servname) AS servname, MAX(b.billdate) AS billdate, MAX(b.pname) AS pname, MAX(b.id) AS id, MAX(b.rno) AS rno, MAX(r.rage) AS age, MAX(r.rsex) AS sex
FROM billing AS b
INNER JOIN registration AS r ON b.rno = r.rno
LEFT JOIN billingDetails AS bd ON b.rno = bd.rno

SELECT MAX(b.servname) AS servname, MAX(b.billdate) AS billdate, MAX(b.pname) AS pname, MAX(b.id) AS id, MAX(b.rno) AS rno, MAX(r.rage) AS age, MAX(r.rsex) AS sex, MAX(bd.rdocname) AS docname, MAX(bd.uname) AS uname FROM billing AS b
INNER JOIN registration AS r ON b.rno = r.rno
INNER JOIN billingDetails AS bd ON r.rno = bd.rno


SELECT bd.rstatus AS rstatus, 
       bd.rno AS rno, 
       bd.pname AS pname, 
       bd.phone AS phone, 
       bd.rdocname AS rdocname, 
       bd.billno AS billno, 
       bd.billdate AS billdate, 
       bd.totalPrice AS totalPrice, 
       bd.totalAdj AS totalAdj, 
       bd.gst AS gst, 
       bd.billAmount AS billAmount, 
       bd.paidAmount AS paidAmount, 
       bd.balance AS balance, 
       bd.status AS status, 
       rs.rage AS rage, 
       rs.rsex AS rsex 
FROM billingDetails AS bd 
INNER JOIN registration AS rs 
ON bd.rno = rs.rno;

ALTER TABLE registration
ADD date DATETIME DEFAULT GETDATE(), -- or appropriate data type
	modifiedBy VARCHAR(MAX),
    modifiedDate DATETIME; -- or appropriate data type

ALTER TABLE registration
ALTER COLUMN opid VARCHAR(MAX) NULL
AFTER rno;
ALTER TABLE registration
ADD opid VARCHAR(MAX) NULL;

delete from registration

-- Drop the default constraint on modifiedDate column
ALTER TABLE registration
DROP CONSTRAINT DF__registrat__modif__3CF0D5C4; -- Replace 'DF__registrat__modif__3CF0D5C4' with the actual name of the default constraint

-- Drop the modifiedDate column
ALTER TABLE registration
DROP COLUMN modifiedBy;


Select rstatus FROM registration

UPDATE registration
SET rno = 'MR000003'
WHERE id = 4;


Select * FROM registration
Select * FROM deptmaster
Select * FROM docmaster
Select * FROM titlemaster
Select * FROM doctorreceipt
Select * FROM packagemaster
Select * FROM servmaster where servname = 'PERICARDIAL FLUID'

SELECT  servmaster.servrate AS servrate FROM servmaster

SELECT servname, servrate FROM servmaster

Select * FROM billing 
Select * from billingDetails WHERE rno = '237493'
select * from ba4 WHERE refno = 3844
Select * FROM AdmitCardCan2324 where regno = '237495'
Select * FROM InBill2324
select * from AdmitCard2324 WHERE regno = '237245'
SELECT * FROM AdmitCard2324 WHERE regno IN (SELECT MAX(regno) FROM AdmitCard2324 GROUP BY regno);





CREATE TABLE discharge (
    id INT PRIMARY KEY IDENTITY(1,1),
    regno NVARCHAR(MAX),
    refno NVARCHAR(MAX),
    pname NVARCHAR(MAX),
	dis_type NVARCHAR(MAX),
    discharge_date NVARCHAR(MAX),
	presenting_complaints NVARCHAR(MAX),
    final_diagnosis NVARCHAR(MAX),
	past_history NVARCHAR(MAX),
    phy_examination NVARCHAR(MAX),
    systemic_examin NVARCHAR(MAX),
    summary_invest NVARCHAR(MAX),
    course_discussion NVARCHAR(MAX),
    condition_discharge NVARCHAR(MAX),
    advice_on_discharge NVARCHAR(MAX),
    username NVARCHAR(MAX),
	CurrentDate DATETIME DEFAULT GETDATE()
);


INSERT INTO discharge (final_diagnosis, reason_for_admission, chief_complaints, history_of_present_illness, personal_history, past, allergies, date_of_procedure, details_of_operation, ot_finding, general_examination, systemic_examination, course_during_hospital_stay, lab_report, condition_on_discharge, transfusions, discharge_advice, follow_on, when_how_to_obtain_urgent_care, medication_during_hospital_course)
VALUES 
('Heart Disease', 'Chest pain', 'Shortness of breath', 'Patient presented with chest pain and shortness of breath.', 'No significant personal history', 'No significant past medical history', 'None', '2024-03-13', 'Coronary artery bypass grafting', 'Normal', 'Normal', 'Normal', 'Stable during hospital stay', 'Normal', 'Discharged in stable condition', 'None', 'Take rest and follow up with cardiologist', 'Follow up after 1 week', 'In case of emergency, visit the nearest ER', 'Aspirin, Clopidogrel');

INSERT INTO discharge (final_diagnosis, reason_for_admission, chief_complaints, history_of_present_illness, personal_history, past, allergies, date_of_procedure, details_of_operation, ot_finding, general_examination, systemic_examination, course_during_hospital_stay, lab_report, condition_on_discharge, transfusions, discharge_advice, follow_on, when_how_to_obtain_urgent_care, medication_during_hospital_course)
VALUES 
('Pneumonia', 'Fever and cough', 'Fever, Cough', 'Patient presented with fever and cough.', 'No significant personal history', 'No significant past medical history', 'Penicillin allergy', '2024-03-12', 'Bronchoscopy', 'Infection in right lung', 'Elevated temperature', 'Normal', 'Improved with antibiotics', 'Positive for bacterial infection', 'Discharged after improvement', 'None', 'Complete the course of antibiotics', 'Follow up after 2 weeks', 'In case of worsening symptoms, contact doctor', 'Antibiotics, Paracetamol');


CREATE TABLE billingDetails(
    id INT PRIMARY KEY IDENTITY(1,1) ,
    rstatus VARCHAR(MAX) NULL,
    rno VARCHAR(MAX) NULL,
    pname VARCHAR(MAX) NULL,
    phone VARCHAR(MAX) NULL,
    rdocname VARCHAR(MAX) NULL,
    billno VARCHAR(MAX) NULL,
    billdate VARCHAR(MAX) NULL,
    totalPrice VARCHAR(MAX) NULL,
    totalAdj VARCHAR(MAX) NULL,
    gst VARCHAR(MAX) NULL,
    billAmount VARCHAR(MAX) NULL,
    paidAmount VARCHAR(MAX) NULL,
    balance VARCHAR(MAX) NULL,
    status VARCHAR(20) NULL ,
	datetime DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE billing (
    id INT PRIMARY KEY IDENTITY(1,1) ,
    rno VARCHAR(MAX) NULL,
    pname VARCHAR(MAX) NULL,
    billno VARCHAR(MAX) NULL,
    billdate VARCHAR(MAX) NULL,
    servname VARCHAR(MAX) NULL,
    servrate VARCHAR(MAX) NULL,
	uname VARCHAR(MAX) NULL,
	datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
	modify_by VARCHAR(MAX) NULL,
	modify_date DATETIME
);

INSERT INTO billing (rno, pname, billno, billdate, servname, servrate) VALUES ('001', 'Abhi', '0003', '22-03-2024', 'x-ray', '2500.00')

INSERT INTO billingDetails (rstatus, rno, pname, phone, rdocname, billno, billdate, totalPrice, totalAdj, gst, billAmount, paidAmount, balance, status)
VALUES ('OPD','000212' ,'Abhi','8101202074', 'Vivek Sarkar', '002125', '22-03-2024', '62000', '', '10', '66000', '50000', '16000', 'cash')




SELECT * FROM servmaster WHERE servname = 'Test2'

EXEC sp_rename 'servmaster.dept2', 'modality', 'COLUMN';


INSERT INTO servmaster (dept, servname, servrate, ServFlag) VALUES ('CT', 'Test2', '50', 'Y')

SELECT * FROM servmaster where srno='5385'

SELECT b.id, b.rno, b.opid, b.billdate, b.billno, b.pname, b.uname, b.servname, b.servrate, r.rsex, r.rage, r.rdoc, s.dept
                                    FROM billing AS b
                                    INNER JOIN registration AS r ON b.rno = r.rno
                                    INNER JOIN servmaster AS s ON b.servname = s.servname 
                                    WHERE s.dept = 'PATHOLOGY'
                                    ORDER BY b.billno DESC