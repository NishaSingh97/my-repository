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
           <img style="height: 120px; padding: 0px; margin-bottom: 0px; margin-right: 0px;">
          </td>
        </tr>
        <tr>
      </table>
      </div>
    ;;

   }

}
