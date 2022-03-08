
{{ config(materialized = 'ephemeral') }}

select  
    * 
    from {{ source('nba', 'src_playedgames') }}
