# The name of this view in Looker is "Title Episode"
view: title_episode {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FIRST_SCHEMA"."TITLE_EPISODE"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Episode Number" in Explore.

  dimension: episode_number {
    type: number
    label: "episode number of the tconst in the TV series"
    sql: ${TABLE}."EPISODE_NUMBER" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  # measure: total_episode_number {
  #   type: count
  #   sql: ${episode_number} ;;
  # }
  # measure: total_seasons {
  #   type: count_distinct
  #   sql: ${season_number} ;;
  # }
  # measure: average_episode_number {
  #   type: number
  #   sql: CASE
  #         WHEN ${total_seasons} = 0
  #         THEN 0
  #         ELSE
  #         ${total_episode_number}/${total_seasons}
  #         END;;
  # }

  dimension: parent_tconst {
    type: string
    label: "alphanumeric identifier of the parent TV Series"
    sql: ${TABLE}."PARENT_TCONST" ;;
  }

  dimension: season_number {
    type: number
    label: "season number the episode belongs to"
    sql: ${TABLE}."SEASON_NUMBER" ;;
  }

  dimension: tconst {
    primary_key: yes
    type: string
    label: "alphanumeric identifier of episode"
    sql: ${TABLE}."TCONST" ;;
  }

 #####################################

  measure: count {
    type: count
    drill_fields: []
  }
}
