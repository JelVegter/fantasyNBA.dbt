{{ config(materialized='table', database='analytics') }}

select  player_key as key
        , player

from {{ ref('stg_player_stats') }}
