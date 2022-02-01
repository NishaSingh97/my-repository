# The name of this view in Looker is "Crew"
view: crew {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FIRST_SCHEMA"."CREW"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Directors" in Explore.

  dimension: directors {
    type: string
    sql: ${TABLE}."DIRECTORS" ;;
  }

  dimension: tconst {
    type: string
    sql: ${TABLE}."TCONST" ;;
  }

  dimension: writers {
    type: string
    sql: ${TABLE}."WRITERS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
