
{{ config(materialized='table', database='analytics') }}

with playedgames as (

    select  "VALUE":c1::DATE AS date
            , "VALUE":c3::STRING AS visitor
            , "VALUE":c4::INTEGER AS points_visitor
            , "VALUE":c5::STRING AS home
            , "VALUE":c6::INTEGER AS points_home
            , "VALUE":c11::STRING AS abbr_home
            , "VALUE":c12::STRING AS abbr_visitor
            , "VALUE":c13::STRING AS date_str
            , "VALUE":c14::STRING AS stats_url
    from {{ ref('base_games') }}

)

select 
    {{ dbt_utils.surrogate_key(['date', 'home']) }} as key
    , {{ dbt_utils.surrogate_key(['abbr_home']) }} as hometeam_key
    , {{ dbt_utils.surrogate_key(['abbr_visitor']) }} as visitorteam_key
    , * 
    from playedgames
