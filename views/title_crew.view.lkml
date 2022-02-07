# The name of this view in Looker is "Crew"
view: title_crew {
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
    description: "director(s) of the given title"
    type: string
    sql: ${TABLE}."DIRECTORS" ;;
  }

  dimension: tconst {
    primary_key: yes
    description: "alphanumeric unique identifier of the title"
    type: string
    sql: ${TABLE}."TCONST" ;;
  }

  dimension: writers {
    description: "writer(s) of the given title"
    type: string
    sql: ${TABLE}."WRITERS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
