-- The organizers need to calculate how many food portions to withhold to create the right amount of tension. 
-- In a table, calculate how many rations would feed 90% of the remaining(alive) non-insider players (rounded down), and in another column, 
-- indicate if the current rations supply is sufficient. (True or False)

SELECT 
    FLOOR(COUNT(*) * 0.90) AS "Needed rations",
    FLOOR(COUNT(*) * 0.90) <= (SELECT amount FROM rations) AS "Has enough rations"
FROM player 
WHERE status = 'alive' 
AND IsInsider IS FALSE;
