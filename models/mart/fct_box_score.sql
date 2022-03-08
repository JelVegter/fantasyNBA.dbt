{{ config(materialized='table', database='analytics') }}

select  key
        , player_key
        , team_key
        , opponent_team_key
        , date
        , mp
        , fgm
        , fga
        , "FG%"
        , "3PTM"
        , "3PA"
        , "3P%"
        , ftm
        , fta
        , "FT%"
        , orb
        , drb
        , reb
        , ast
        , stl
        , blk
        , "TO"
        , pf
        , pts
        , plus_minus
        , case 
            when game_location = 'Home'
            then 1
            else 0
          end as home_team
        
from {{ ref('stg_player_stats') }}