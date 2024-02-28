-- Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

select distinct fp.* from facebook_reactions fr inner join facebook_posts fp on fr.post_id = fp.post_id where reaction = 'heart';
