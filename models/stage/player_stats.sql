
-- {{ config(materialized='table') }}

-- with player_stats as (

-- select  "VALUE":c1::STRING AS player
--         ,"VALUE":c2::STRING AS mp
--         ,"VALUE":c3::INTEGER AS fgm
--         ,"VALUE":c4::INTEGER AS fga
--         ,"VALUE":c5::FLOAT AS "FG%"
--         ,"VALUE":c6::INTEGER AS "3PTM"
--         ,"VALUE":c7::INTEGER AS "3PA"
--         ,"VALUE":c8::FLOAT AS "3P%"
--         ,"VALUE":c9::INTEGER AS ftm
--         ,"VALUE":c10::INTEGER AS fta
--         ,"VALUE":c11::FLOAT AS "FT%"
--         ,"VALUE":c12::INTEGER AS orb
--         ,"VALUE":c13::INTEGER AS drb
--         ,"VALUE":c14::INTEGER AS reb
--         ,"VALUE":c15::INTEGER AS ast
--         ,"VALUE":c16::INTEGER AS stl
--         ,"VALUE":c17::INTEGER AS blk
--         ,"VALUE":c18::INTEGER AS "TO"
--         ,"VALUE":c19::INTEGER AS pf
--         ,"VALUE":c20::INTEGER AS pts
--         ,"VALUE":c21::INTEGER AS plus_minus
--         ,"VALUE":c22::STRING AS team
--         ,"VALUE":c23::STRING AS opponent
--         ,"VALUE":c24::STRING AS game_location
--         ,"VALUE":c25::DATE AS date
-- from src_playerstats
-- where mp not in (
--         'Did Not Play', 
--         'Did Not Dress', 
--         'Not With Team', 
--         'Player Suspended')

-- )

-- select  ROW_NUMBER() over (ORDER BY date, team, player) as id
--         ,player, date
--         ,CAST(SPLIT_PART(mp, ':', 0) as FLOAT) + (CAST(SPLIT_PART(mp, ':', 1) as FLOAT)/60) AS mp
--         ,fgm, fga, "FG%", "3PTM", "3PA", "3P%", ftm
--         ,fta, "FT%", orb, drb, reb, ast, stl, blk, "TO"
--         ,pf, pts, plus_minus, team, opponent,game_location 
--         from player_stats