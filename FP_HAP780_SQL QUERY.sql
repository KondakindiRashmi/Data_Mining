Use [HAP780 PROJECT]

SELECT * FROM dbo.admissions
select * from dbo.ICUSTAYS

select [diagnosis], count(*) from dbo.admissions
group by [diagnosis]

select a.hadm_id as hadm_id, a.admittime as admtimme, a.dischtime as dischtimee, a.admission_type as admissiontype,
       a.insurance as insurance, a.religion as religion, a.marital_status as maritalstatus, 
       a.ethnicity as ethnicity, a.edregtime as edregtime, a.edouttime as edoutime, a.diagnosis as diagnosis,
	   a.hospital_expire_flag as hospexpflag, a.has_chartevents_data as charteventsdata,
	   CASE WHEN a.ethnicity = 'WHITE' THEN 'WHITE' ELSE 'NOT WHITE' END as ethnicity_white,
	   CASE WHEN i.[last_careunit] = i.[first_careunit] THEN 'MATCH' ELSE 'NO MATCH' END as careunit_match,
	   CASE WHEN a.edouttime is null THEN 'Alive' ELSE 'Dead' END as survival,
	   i.hadm_id as hadmid, i.icustay_id as icustayid, i.first_careunit as firstcareunit, i.last_careunit as lastcareunit,
	   i.first_wardid as firstwardid, i.last_wardid as lastwardid, i.intime as intime, i.outtime as outime, i.los as los

       into #temp from dbo.admissions a inner join dbo.ICUSTAYS i on a.hadm_id = i.hadm_id 

select * from #temp

;
select diagnosis, count(*) as NO_Patients, AVG(CAST(los AS float)) AS avg_los

into #temp1
from #temp
group by diagnosis
order by NO_Patients desc;

select * from #temp1