-- Calculate the percentage of spam posts in all viewed posts by day. A post is considered a spam if a string "spam" is inside keywords of the post. N
-- Note that the facebook_posts table stores all posts posted by users. The facebook_post_views table is an action table denoting if a user has viewed a post.

select 
post_date,
100*count(distinct case when post_keywords like '%spam%' then viewer_id end) 
/count(*)
from facebook_posts inner join facebook_post_views
on facebook_posts.post_id = facebook_post_views.post_id
where viewer_id is not null
group by post_date
order by post_date;
