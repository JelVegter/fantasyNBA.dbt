
{{ config(materialized = 'ephemeral') }}

select  
    * 
    from {{ models('nba', 'src_player_stats') }}
