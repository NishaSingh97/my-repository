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
    description: "Additional terms to describe this alternative title, not enumerated"
    sql: ${TABLE}."ATTRIBUTES" ;;
  }

  dimension: isoriginaltitle {
    type: number
    description: "0: not original title; 1: original title"
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
    description: "the language of the title"
    sql: ${TABLE}."LANGUAGE" ;;
  }

  dimension: ordering {
    type: number
    description: "a number to uniquely identify rows for a given titleId"
    sql: ${TABLE}."ORDERING" ;;
  }

  dimension: region {
    type: string
    map_layer_name: countries
    description: " the region for this version of the title"
    sql: ${TABLE}."REGION" ;;
  }

  # dimension: region_map {
  #   type: location
  #   map_layer_name: countries
  #   sql: ${region} ;;
  #   hidden: yes
  # }

  dimension: title {
    type: string
    description: "the localized title"
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: title_id {
    primary_key: yes
    type: string
    description: "a tconst, an alphanumeric unique identifier of the title"
    sql: ${TABLE}."TITLE_ID" ;;
  }

  dimension: types {
    type: string
    description: "set of attributes for this alternative title. One or more of the following: 'alternative', 'dvd', 'festival', 'tv', 'video', 'working', 'original', imdbDisplay."
    sql: ${TABLE}."TYPES" ;;
  }

 #####################################

  # measure: count {
  #   type: count
  #   drill_fields: []
  # }
}
