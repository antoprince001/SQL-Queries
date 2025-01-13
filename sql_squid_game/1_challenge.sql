-- The organizers want to identify vulnerable living players who might be easily manipulated for the next game. 
-- Find all players who are alive, in severe debt (debt > 400,000,000 won), and are either elderly (age > 65) OR have a vice of Gambling with no family connections.

select * from player
where status = 'alive' and debt > 400000000 and (age>65 or (vice = 'Gambling' and has_close_family is false))              
