
{{ config(materialized='table') }}

with player_stats as (

select  "VALUE":c1::STRING AS player
        ,"VALUE":c2::STRING AS mp
        ,"VALUE":c3::INTEGER AS fgm
        ,"VALUE":c4::INTEGER AS fga
        ,"VALUE":c5::FLOAT AS "fg%"
        ,"VALUE":c6::INTEGER AS "3ptm"
        ,"VALUE":c7::INTEGER AS "3pa"
        ,"VALUE":c8::FLOAT AS "3p%"
        ,"VALUE":c9::INTEGER AS ftm
        ,"VALUE":c10::INTEGER AS fta
        ,"VALUE":c11::FLOAT AS "ft%"
        ,"VALUE":c12::INTEGER AS orb
        ,"VALUE":c13::INTEGER AS drb
        ,"VALUE":c14::INTEGER AS reb
        ,"VALUE":c15::INTEGER AS ast
        ,"VALUE":c16::INTEGER AS stl
        ,"VALUE":c17::INTEGER AS blk
        ,"VALUE":c18::INTEGER AS "to"
        ,"VALUE":c19::INTEGER AS pf
        ,"VALUE":c20::INTEGER AS pts
        ,"VALUE":c21::INTEGER AS "+/-"
        ,"VALUE":c22::STRING AS team
        ,"VALUE":c23::STRING AS opponent
        ,"VALUE":c24::STRING AS "home/away"
        ,"VALUE":c25::STRING AS date
from src_playerstats
where mp != 'Did Not Play'

)

select  ROW_NUMBER() over (ORDER BY date, player) as id
        ,player, date
        ,SPLIT_PART(mp, ':', 0) AS mp
        ,fgm, fga, "fg%", "3ptm", "3pa", "3p%", ftm
        ,fta, "ft%", orb, drb, reb, ast, stl, blk, "to"
        ,pf, pts, "+/-", team, opponent,"home/away" 
        from player_stats