
{{ config(materialized = 'ephemeral') }}

select  
    * 
    from {{ models('nba', 'src_games') }}
