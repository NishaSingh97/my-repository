# The name of this view in Looker is "Title Basic"
view: title_basic {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FIRST_SCHEMA"."TITLE_BASIC"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "End Year" in Explore.

  dimension: end_year {
    type: string
    sql: ${TABLE}."END_YEAR" ;;
  }

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

  dimension: start_year {
    type: number
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
    type: count_distinct
    drill_fields: [tconst,primary_title,genres,start_year,end_year,run_time_minutes]
  }

  dimension: date_diff_year {
    type: number
    label: "By Year"
    group_label: "Difference"
    sql: DATEDIFF( year, ${end_year}, ${start_year}) ;;
  }

  # dimension_group: event {
  #   convert_tz: no
  #   type: time
  #   timeframes: [time, date, hour, time_of_day, hour_of_day, week, day_of_week_index, day_of_week, month, year]
  #   sql: ${TABLE}.created_at ;;
  # }
}
