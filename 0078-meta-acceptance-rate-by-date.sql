-- What is the overall friend acceptance rate by date? Your output should have the rate of acceptances by the date the request was sent. Order by the earliest date to latest.


-- Assume that each friend request starts by a user sending (i.e., user_id_sender) a friend request to another user (i.e., user_id_receiver) that's logged in the table with action = 'sent'.
-- If the request is accepted, the table logs action = 'accepted'. If the request is not accepted, no record of action = 'accepted' is logged.

select ffr1.date, count(ffr2.user_id_receiver )::float/count(*)
from fb_friend_requests ffr1 left join fb_friend_requests ffr2
on ffr1.user_id_sender = ffr2.user_id_sender and 
ffr1.user_id_receiver = ffr2.user_id_receiver  
and ffr2.action = 'accepted'
where ffr1.action = 'sent'
group by ffr1.date
order by ffr1.date;

# type casting ::float
