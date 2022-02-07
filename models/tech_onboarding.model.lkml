# Define the database connection to be used for this model.
connection: "tech_onboarding"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: tech_onboarding_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: tech_onboarding_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Tech Onboarding"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: title_ratings {
  join: title_movies {
    sql_on: ${title_ratings.tconst} = ${title_movies.tconst} ;;
    relationship: one_to_many
  }
  join: title_crew {
    sql_on: ${title_ratings.tconst} = ${title_crew.tconst} ;;
    relationship: one_to_many
  }
  join: title_names {
    sql_on: ${title_ratings.tconst} = ${title_names.known_for_titles} ;;
    relationship: one_to_many
  }
  join: title_principals {
    sql_on: ${title_ratings.tconst} = ${title_principals.tconst} ;;
    relationship: one_to_many
  }
  join: title_episode {
    sql_on: ${title_ratings.tconst} = ${title_episode.tconst} ;;
    relationship: one_to_one
  }
  join: title_info {
    sql_on: ${title_ratings.tconst} = ${title_info.title_id} ;;
    relationship: one_to_many
  }
}
