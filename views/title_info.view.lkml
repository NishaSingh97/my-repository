# The name of this view in Looker is "Title Info"
view: title_info {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FIRST_SCHEMA"."TITLE_INFO"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Attributes" in Explore.

  dimension: attributes {
    type: string
    sql: ${TABLE}."ATTRIBUTES" ;;
  }

  dimension: isoriginaltitle {
    type: number
    sql: ${TABLE}."ISORIGINALTITLE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_isoriginaltitle {
    type: sum
    sql: ${isoriginaltitle} ;;
  }

  measure: average_isoriginaltitle {
    type: average
    sql: ${isoriginaltitle} ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}."LANGUAGE" ;;
  }

  dimension: ordering {
    type: number
    sql: ${TABLE}."ORDERING" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: title_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."TITLE_ID" ;;
  }

  dimension: types {
    type: string
    sql: ${TABLE}."TYPES" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
