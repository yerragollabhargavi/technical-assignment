-- A) How many types of acacia Plants

Select count(*) as no_of_acacia_plants_type from taxonomy where species="acacia";

-- Get Longest Dna where species is wheat

Select max(r.length) as logest_sequence from rfamseq r join taxonamy t on t.ncbi_id=r.ncbi_id where t.species like "%wheat%" group by t.species;
-- select Family Name, Family Accesssion and Maximum DNA Sequence

Select f.rfam_id as Family_Name , f.rfam_acc as Family_Accession , r.length as Maximum_DNA_Sequence 
from rfamseq r join family f on r.rfam_acc=f.rfam_acc where r.length>1000000 order by r.length desc limit 135, offset ;
