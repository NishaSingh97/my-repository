# The name of this view in Looker is "Title Principals Split"
view: title_principals {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FIRST_SCHEMA"."TITLE_PRINCIPALS_SPLIT"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: characters {
    type: string
    sql: ${TABLE}."CHARACTERS" ;;
  }

  dimension: job {
    type: string
    sql: ${TABLE}."JOB" ;;
  }

  dimension: nconst {
    type: string
    sql: ${TABLE}."NCONST" ;;
  }

  dimension: ordering {
    type: number
    sql: ${TABLE}."ORDERING" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ordering {
    type: sum
    sql: ${ordering} ;;
  }

  measure: average_ordering {
    type: average
    sql: ${ordering} ;;
  }

  dimension: tconst {
    primary_key: yes
    type: string
    sql: ${TABLE}."TCONST" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
