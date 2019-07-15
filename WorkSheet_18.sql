USE BLACKBOARD_DATA_DEMO;

select

  subject_desc,
  count(distinct lc.id) as lms_course_count,
  count(distinct lci.course_id) as lms_courses_using_item,
  lms_course_count - lms_courses_using_item as lms_courses_not_using_item,
  lms_courses_using_item/lms_course_count

from cdm_sis.course_catalog scc

inner join cdm_sis.class_section scs  on scs.course_catalog_id = scc.id
inner join cdm_map.course mc  on mc.sis_course_id = scs.id
inner join cdm_lms.course lc   on lc.id = mc.lms_course_id
inner join cdm_lms.term lt   on lt.id = lc.term_id
left join cdm_lms.course_item as lci   on lci.course_id = lc.id   and item_type = 'ANNOUNCEMENT' -- Note: Case-sensitive

where lt.name = 'Fall 2018' and subject_desc='Education'
group by subject_desc