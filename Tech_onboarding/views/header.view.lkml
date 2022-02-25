view: header {
    derived_table: {
      sql: SELECT 1 ;;
    }

    dimension: header {
      type: string
      sql: 1 ;;
      html:
      <div style="padding-bottom:0px;
       z-index: 999;">
      <table style="text-align: center; border-collapse: collapse; padding: 0px;">
        <col width="60%">
        <col width="20%">
        <tr>
          <td style="text-align: left; font-size: 35px; font-weight: 400; padding: 0px;  color: #000050;"  width="100%" height="100%">
           Movies Insights Dashboard
          </td>
          <td style="text-align: right; font-size: 128px; padding: 0px; color: #999;"  width="100%" height="100%">
            <img style="height: 120px; padding: 0px; margin-bottom: 0px; margin-right: 0px;" <img src = "https://media-exp3.licdn.com/dms/image/C4D0BAQHOLkyn8haZ-A/company-logo_200_200/0/1608559321953?e=2159024400&v=beta&t=lDsj6xIxyjvSj7iHNsHPp3_xtWAegzySB8W4_I2Bxjc"/>
          </td>
        </tr>
        <tr>
      </table>
      </div>
    ;;

  }
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: header {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
