view: ranking {

  derived_table: {
    sql: SELECT
   "TCONST",
   "AVERAGE_RATINGS",
   "NUM_VOTES",
    dense_rank() over(order by "AVERAGE_RATINGS" desc) rank
FROM "FIRST_SCHEMA"."TITLE_RATINGS"
where "NUM_VOTES" > {%parameter choose_threshold%}
;;
  }

  parameter: choose_threshold {
    type: number
    allowed_value: {
      label: "20000"
      value : "10000"
    }
    allowed_value: {
      label: "50000"
      value : "50000"
    }
    allowed_value: {
      label: "100000"
      value : "100000"
    }
    allowed_value: {
      label: "200000"
      value : "200000"
    }
  }
  dimension: TCONST {
    type: string
    label: "No. of movies"
  }
  dimension: NUM_VOTES {
    type: number
    label: "No. of votes"
    drill_fields: [title_movies.tconst,title_movies.genres,title_movies.start_year_year,average_average_ratings ]
  }
  dimension: average_ratings{
    type: number
    label: "Average ratings"
  }
  dimension: rank {
    type: number
    label: "Overall rank"
    sql: ${TABLE}.rank ;;
  }
  measure: average_average_ratings {
    value_format: "0.0"
    type: average
    label: "Average ratings"
    sql: ${average_ratings} ;;
  }
}
