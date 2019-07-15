select * from cdm_lms.course_item where item_type_source_code like '%tube%'

select count(distinct ci.course_id) from  cdm_lms.course_item ci where ci.item_type='YOUTUBE'


select count(*) as distinctcourses
from (select distinct ci.course_id from  cdm_lms.course_item ci where ci.item_type='YOUTUBE')

select 

    --count(distinct pc.person_id)
    --ci.course_id, 
  count(distinct ci.course_id),
   -- ci.item_type
     --   count(pc.course_id) as count_courses,
  p.id,
  p.first_name, 
  p.last_name,
  pc.course_role
 --   pc.course_role

from   cdm_lms.course_item ci
left outer join cdm_lms.course c  on (ci.course_id = c.id)
left outer join cdm_lms.person_course pc  on (ci.course_id = pc.course_id) 
left outer join cdm_lms.person p  on (pc.person_id = p.id) 

where ci.item_type='YOUTUBE'
and pc.course_role='Instructor'
--and p.first_name='Aaden'
--and p.last_name='Kaps'

group by 
  p.id,
--  ci.course_id,-
  --ci.item_type,
p.first_name,
p.last_name,
pc.course_role
 
order by
 1 desc
 
 first 8 nothing
 