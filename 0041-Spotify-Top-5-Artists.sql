-- Assume there are three Spotify tables containing information about the artists, songs, and music charts. Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the highest number of times. From now on, we'll refer to this ranking number as "song appearances".

-- Output the top 5 artist names in ascending order along with their song appearances ranking (not the number of song appearances, but the rank of who has the most appearances). The order of the rank should take precedence.

WITH top_appearances AS(
SELECT artist_id, count(*) as appearance
FROM global_song_rank INNER JOIN songs USING (song_id)
WHERE "rank" BETWEEN 1 and 10
GROUP BY artist_id
ORDER BY appearance DESC),

top_ranks AS (
SELECT artist_id, DENSE_RANK()
OVER(
  ORDER BY appearance DESC
) as artist_rank
FROM top_appearances 
)

SELECT artist_name, artist_rank
FROM top_ranks INNER JOIN artists USING (artist_id)
WHERE artist_rank <= 5
ORDER BY artist_rank, artist_name;
