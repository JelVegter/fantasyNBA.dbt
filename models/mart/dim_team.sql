
{{ config(materialized='table', database='analytics') }}

with team as (

select  visitorteam_key as key
        , abbr_visitor as abbr_team
        , visitor as team
    from {{ ref('stg_games') }}

    union

select  hometeam_key as key
        , abbr_home as abbr_team
        , home as team
    from {{ ref('stg_games') }}

)

select 
    *
    from team
