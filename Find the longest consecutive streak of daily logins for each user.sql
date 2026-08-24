/*
Find the longest consecutive streak of daily logins for each user.
*/


CREATE TABLE user_logins (
    user_id INT,
    login_date DATE
);

INSERT INTO user_logins (user_id, login_date) VALUES

(1, '2026-08-01'),
(1, '2026-08-02'),
(1, '2026-08-03'),
(1, '2026-08-04'),
(1, '2026-08-05'),
(1, '2026-08-08'),
(1, '2026-08-09'),

(2, '2026-08-01'),
(2, '2026-08-02'),
(2, '2026-08-03'),
(2, '2026-08-04'),
(2, '2026-08-07'),

(3, '2026-08-10'),
(3, '2026-08-11'),
(3, '2026-08-12'),
(3, '2026-08-15'),


(3, '2026-08-10');


select * from user_logins;

WITH x AS (
    SELECT DISTINCT
        user_id,
        CAST(login_date AS DATE) AS login_date
    FROM user_logins
),
y AS (
    SELECT *,
        DATEADD(DAY, -ROW_NUMBER() OVER (
            PARTITION BY user_id ORDER BY login_date
        ), login_date) AS grp
    FROM x
),
z AS (
    SELECT
        user_id,
        COUNT(*) AS streak_length,
        MIN(login_date) AS start_date,
        MAX(login_date) AS end_date
    FROM y
    GROUP BY user_id, grp
)
SELECT TOP 1 WITH TIES
    user_id,
    streak_length,
    start_date,
    end_date
FROM z
ORDER BY ROW_NUMBER() OVER (
    PARTITION BY user_id
    ORDER BY streak_length DESC
);