# The name of this view in Looker is "Title Names Split"
view: title_names {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FIRST_SCHEMA"."TITLE_NAMES_SPLIT"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Birth Year" in Explore.

  dimension: birth_year {
    description: "birth year in YYYY format"
    type: number
    sql: ${TABLE}."BIRTH_YEAR" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  # measure: total_birth_year {
  #   type: sum
  #   sql: ${birth_year} ;;
  # }

  # measure: average_birth_year {
  #   type: average
  #   sql: ${birth_year} ;;
  # }

  dimension: death_year {
    description: "death year in YYYY format if applicable, else '\N'"
    type: number
    sql: ${TABLE}."DEATH_YEAR" ;;
  }

  dimension: known_for_titles {
    description: "titles the person is known for"
    type: string
    sql: ${TABLE}."KNOWN_FOR_TITLES" ;;
  }

  dimension: nconst {
    primary_key: yes
    description: "alphanumeric unique identifier of the name/person"
    type: string
    sql: ${TABLE}."NCONST" ;;
  }

  dimension: primary_name {
    description: "name by which the person is most often credited"
    type: string
    sql: ${TABLE}."PRIMARY_NAME" ;;
  }

  dimension: primary_profession {
    description: " the top-3 professions of the person"
    type: string
    sql: ${TABLE}."PRIMARY_PROFESSION" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
