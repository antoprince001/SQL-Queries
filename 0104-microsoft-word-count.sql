-- Find the number of times each word appears in drafts.

SELECT 
   TRIM(BOTH '.,' FROM LOWER(UNNEST(STRING_TO_ARRAY(contents, ' ')))) AS words,
   COUNT (*)
FROM google_file_store
WHERE filename LIKE '%draft%'
GROUP BY words


with word_parts as (
select lower(unnest(string_to_array(replace(replace(contents,'.',''),',',''),' '))) as word 
from google_file_store
where filename ilike '%draft%'
)

select word, count(word) as nentry
from word_parts
group by word;


