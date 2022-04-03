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
          THEN ${total_votes}
          END;;
  }

  # measure: dynamic_measure2 {
  #   label_from_parameter: choose_metric
  #   type: number
  #   value_format: "0.0"
  #   sql: CASE
  #         WHEN {% parameter choose_metric %}  = 'rating'
  #         THEN ${average_average_ratings}
  #         WHEN {% parameter choose_metric %} = 'votes'
  #         THEN ${total_votes}
  #         END;;
  #   html:
  #   {% if choose_metric._parameter_value == "'rating'" %}
  #   <a style="color:black;" href="https://biprocsi.eu.looker.com/dashboards-next/204?Year={{ _filters['titl_movies.start_year_year'] | url_encode }}+to+{{ _filters['titl_movies.end_year_year'] | url_encode }}&Choose+Metric=rating"> {{rendered_value}} </a>
  #   {% else %}
  #   <a style="color:black;" href="https://biprocsi.eu.looker.com/dashboards-next/208?Year={{ _filters['titl_movies.start_year_year'] | url_encode }}+to+{{ _filters['titl_movies.end_year_year'] | url_encode }}&Choose+Metric={{ _filters['votes'] | url_encode }}"> {{rendered_value}} </a>
  #   {% endif %};;
  # }

  # dimension: dynamic_dim {
  #   label_from_parameter: choose_metric
  #   type: number
  #   value_format: "0.0"
  #   sql:
  #       {% if choose_metric._parameter_value == "'rating'" %}
  #         ${average_average_ratings}
  #       {% elsif choose_metric._parameter_value == "'votes'" %}
  #         ${total_votes}
  #       {% else %}
  #         ${total_votes}
  #       {% endif %};;
  #   description: "Dynamic dimension"
  #   html:
  #   {% if dynamic_dimension._parameter_value == "'rating'" %}
  #   <a style="color:black;" href="https://biprocsi.eu.looker.com/dashboards-next/204?Year={{ _filters['start_year'] | url_encode }}+to+{{ _filters['end_year_year'] | url_encode }}&Choose+Metric={{ _filters['rating'] | url_encode }}"> {{rendered_value}} </a>
  #   {% else %}
  #   <a style="color:black;" href="https://biprocsi.eu.looker.com/dashboards-next/208?Year={{ _filters['start_year'] | url_encode }}+to+{{ _filters['end_year_year'] | url_encode }}&Choose+Metric={{ _filters['rating'] | url_encode }}"> {{rendered_value}} </a>
  #   {% endif %};;
  # }

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
    type: average
    sql: ${average_ratings} ;;
    value_format: "0.0"
    html: <p>{{value}} Average Rating for the Genre <span>{{title_movies.genre._value}}</span></p> ;;
    drill_fields: [tconst,average_average_ratings]
  }

  dimension: num_votes {
    description: "number of votes the title has received"
    type: number
    sql: ${TABLE}."NUM_VOTES" ;;
  }

  measure: total_votes {
    description: "total number of votes the title has received"
    type: sum
    sql: ${num_votes} ;;
    value_format: "0"
    drill_fields: [tconst,title_movies.genres,average_average_ratings ]
  }

  dimension: tconst {
    primary_key: yes
    description: "alphanumeric unique identifier of the title"
    type: string
    sql: ${TABLE}."TCONST" ;;
  }

 #####################################

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }

}
