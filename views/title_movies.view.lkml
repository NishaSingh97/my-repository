# The name of this view in Looker is "Title Basic Updated"
view: title_movies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FIRST_SCHEMA"."TITLE_BASIC_UPDATED"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end_year {
    description: "TV Series end year. ‘\N’ for all other title types"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."END_YEAR" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Genres" in Explore.

  dimension: genres {
    description: "includes up to three genres associated with the title"
    type: string
    sql: ${TABLE}."GENRES" ;;
  }

  dimension: is_adult {
    description: "0: non-adult title; 1: adult title"
    type: number
    sql: ${TABLE}."IS_ADULT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_is_adult {
    type: sum
    sql: ${is_adult} ;;
  }

  measure: average_is_adult {
    type: average
    sql: ${is_adult} ;;
  }

  dimension: original_title {
    description: "original title, in the original language"
    type: string
    sql: ${TABLE}."ORIGINAL_TITLE" ;;
  }

  dimension: primary_title {
    description: "the more popular title / the title used by the filmmakers on promotional materials at the point of release"
    type: string
    sql: ${TABLE}."PRIMARY_TITLE" ;;
    drill_fields: [primary_title,genres,is_adult,start_year_year,end_year_year,run_time_minutes]
  }

  dimension: run_time_minutes {
    description: "primary runtime of the title, in minutes"
    type: number
    sql: ${TABLE}."RUN_TIME_MINUTES" ;;
  }

  dimension_group: start_year {
    description: "represents the release year of a title. In the case of TV Series, it is the series start year"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."START_YEAR" ;;
  }

  dimension: tconst {
    primary_key: yes
    description: "alphanumeric unique identifier of the title"
    type: string
    sql: ${TABLE}."TCONST" ;;
  }

  dimension: title_type {
    description: "the type/format of the title (e.g. movie, short, tvseries, tvepisode, video, etc)"
    type: string
    sql: ${TABLE}."TITLE_TYPE" ;;
  }

  measure: count {
    description: "number of unique identifier of the title"
    type: count
    drill_fields: []
  }
}
