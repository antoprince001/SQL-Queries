-- As a Data Analyst on Snowflake's Marketing Analytics team, your objective is to analyze customer relationship management (CRM) data and identify contacts that satisfy two conditions:

-- Contacts who had a marketing touch for three or more consecutive weeks.
-- Contacts who had at least one marketing touch of the type 'trial_request'.
-- Marketing touches, also known as touch points, represent the interactions or points of contact between a brand and its customers.

-- Your goal is to generate a list of email addresses for these contacts.


SELECT email 
FROM  crm_contacts
WHERE contact_id IN (


SELECT contact_id FROM (

SELECT contact_id, event_date, 
lead(event_date,1) OVER (partition by contact_id order by event_date) as second_touch,
lead(event_date,2) OVER (partition by contact_id order by event_date) as third_touch
FROM marketing_touches
order by contact_id, event_date

) t
where event_date is not null and second_touch is not null and third_touch is not null
and  second_touch - event_date < 14 and second_touch - event_date > 4
and third_touch - second_touch < 14 and third_touch - second_touch > 4
and contact_id in (
SELECT DISTINCT contact_id
FROM marketing_touches
WHERE event_type = 'trial_request'
)

)
