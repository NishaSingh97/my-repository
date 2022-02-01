# The name of this view in Looker is "Title Basic Updated"
view: title_basic_updated {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FIRST_SCHEMA"."TITLE_BASIC_UPDATED"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end_year {
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
    type: string
    sql: ${TABLE}."GENRES" ;;
  }

  dimension: is_adult {
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
    type: string
    sql: ${TABLE}."ORIGINAL_TITLE" ;;
  }

  dimension: primary_title {
    type: string
    sql: ${TABLE}."PRIMARY_TITLE" ;;
  }

  dimension: run_time_minutes {
    type: number
    sql: ${TABLE}."RUN_TIME_MINUTES" ;;
  }

  dimension_group: start_year {
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
    type: string
    sql: ${TABLE}."TCONST" ;;
  }

  dimension: title_type {
    type: string
    sql: ${TABLE}."TITLE_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
