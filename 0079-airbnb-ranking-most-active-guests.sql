-- Rank guests based on the total number of messages they've exchanged with any of the hosts. Guests with the same number of messages as other guests should have the same rank. Do not skip rankings if the preceding rankings are identical.
-- Output the rank, guest id, and number of total messages they've sent. Order by the highest number of total messages first.

select dense_rank() over(order by sum(n_messages) desc ) as ranking, id_guest, sum(n_messages) as sum_n_messages
from airbnb_contacts
group by id_guest
order by sum_n_messages desc;
