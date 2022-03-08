{{ config(materialized='view', database='analytics') }}

with box_scores as (

        select  rank() over (partition by player_key
                                order by date desc) as games_ago
                , * 
                from {{ ref('fct_box_score') }}

) 

select  p.key
        , p.player
        , t.team
        , t.abbr_team

        , round ( avg( 
                fgm * 2 
                - fga    
                + ftm    
                - fta 
                + "3PTM"
                + reb
                + ast * 2
                + stl * 4
                + blk * 4
                - "TO" * 2
                + pts
                ), 1 ) as fantasy_points

        , round ( avg( mp ), 1 ) as mp
        , round ( avg( fgm ), 1 ) as fgm
        , round ( avg( fga ), 1 ) as fga
        , round ( avg( "FG%" ), 1 ) as "FG%"
        , round ( avg( "3PTM" ), 1 ) as "3PTM"
        , round ( avg( "3PA" ), 1 ) as "3PA"
        , round ( avg( "3P%" ), 1 ) as "3P%"
        , round ( avg( ftm ), 1 ) as ftm
        , round ( avg( fta ), 1 ) as fta
        , round ( avg( "FT%" ), 1 ) as "FT%"
        , round ( avg( orb ), 1 ) as orb
        , round ( avg( drb ), 1 ) as drb
        , round ( avg( reb ), 1 ) as reb
        , round ( avg( ast ), 1 ) as ast
        , round ( avg( stl ), 1 ) as stl
        , round ( avg( blk ), 1 ) as blk
        , round ( avg( "TO" ), 1 ) as "TO"
        , round ( avg( pf ), 1 ) as pf
        , round ( avg( pts ), 1 ) as pts
        , round ( avg( plus_minus ), 1 ) as plus_minus
from box_scores b 
        inner join {{ ref('dim_player') }} p on p.key=b.player_key
        inner join {{ ref('dim_team') }} t on t.key=b.team_key

        where b.games_ago < 31

        group by p.key
                 , p.player
                 , t.team
                 , t.abbr_team
        
