{{ config(materialized='table', database='analytics') }}

select  key
        , hometeam_key
        , visitorteam_key
        , date
        , points_home
        , points_visitor

from {{ ref('stg_games') }}
