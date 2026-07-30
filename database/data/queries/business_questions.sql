-- Business Question 1
-- Who are the top artists by streams?


SELECT

artist_name,

SUM(streams) AS total_streams

FROM artists a

JOIN songs s
ON a.artist_id=s.artist_id

JOIN listening_history l
ON s.song_id=l.song_id

GROUP BY artist_name

ORDER BY total_streams DESC;



-- Business Question 2
-- Who are the most active users?


SELECT

first_name,

last_name,

SUM(minutes_played)/60 AS hours_listened

FROM users u

JOIN listening_history l

ON u.user_id=l.user_id

GROUP BY user_id

ORDER BY hours_listened DESC;
