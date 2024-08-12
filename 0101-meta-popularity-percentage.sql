-- Find the popularity percentage for each user on Meta/Facebook. The popularity percentage is defined as the total number of friends the user has divided by the total number of users on the platform, then converted into a percentage by multiplying by 100.
-- Output each user along with their popularity percentage. Order records in ascending order by user id.
-- The 'user1' and 'user2' column are pairs of friends.


with combined_calculation as
(select user1 as userid, count(distinct user2) as friend_count from facebook_friends group by user1
union  select user2 as userid,count(distinct user1) as friend_count from facebook_friends
group by user2
)
select userid, (sum(friend_count) *100)/((
select count(distinct userid)
from combined_calculation
)) 
from combined_calculation
group by userid 


WITH users_union AS
  (SELECT user1,
          user2
   FROM facebook_friends
   UNION SELECT user2 AS user1,
                user1 AS user2
   FROM facebook_friends)
SELECT user1,
       count(*)::float /
  (SELECT count(DISTINCT user1)
   FROM users_union)*100 AS popularity_percent
FROM users_union
GROUP BY 1
ORDER BY 1
