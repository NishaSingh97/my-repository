# The name of this view in Looker is "Title Ratings"
view: title_ratings {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FIRST_SCHEMA"."TITLE_RATINGS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Average Ratings" in Explore.

  dimension: average_ratings {
    description: "weighted average of all the individual user ratings"
    type: number
    sql: ${TABLE}."AVERAGE_RATINGS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  parameter: choose_metric {
    type: string
    allowed_value: {
      label: "Average Ratings"
      value: "rating"
    }
    allowed_value: {
      label: "Number of votes"
      value: "votes"
    }
  }

  measure: dynamic_measure {
    label_from_parameter: choose_metric
    type: number
    value_format: "0.0"
    sql: CASE
          WHEN {% parameter choose_metric %}  = 'rating'
          THEN ${average_average_ratings}
          WHEN {% parameter choose_metric %} = 'votes'
          THEN SUM(${num_votes})
          END;;
  }

  measure: rating_series {
    type: average
    sql:  ${average_ratings};;
    filters: [title_movies.is_tv_series : "yes"]
    hidden: yes
  }

  measure: total_average_ratings {
    type: sum
    sql: ${average_ratings} ;;
  }

  measure: average_average_ratings {
    value_format: "0.0"
    type: average
    sql: ${average_ratings} ;;
  }

  dimension: num_votes {
    description: "number of votes the title has received"
    type: number
    sql: ${TABLE}."NUM_VOTES" ;;
  }

  dimension: tconst {
    primary_key: yes
    description: "alphanumeric unique identifier of the title"
    type: string
    sql: ${TABLE}."TCONST" ;;
  }

 #####################################

  measure: count {
    type: count
    drill_fields: []
  }

}
