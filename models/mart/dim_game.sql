{{ config(materialized='table', database='analytics') }}

select  key
        , hometeam_key
        , visitorteam_key
        , date
        , visitor
        , abbr_visitor
        , home
        , abbr_home
        , date_str
        , stats_url

from {{ ref('stg_games') }}
