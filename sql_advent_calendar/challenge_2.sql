-- Santa wants to know which gifts weigh more than 1 kg. Can you list them?

SELECT DISTINCT gift_name
FROM gifts
WHERE weight_kg > 1.0;
