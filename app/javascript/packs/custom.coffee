#ajax for filter out the cash management based on company
$(document).on 'turbolinks:load', ->
  $('#company_id').change ->
    $.ajax
      url: '/cash_managements/filter_cash_management'
      type: 'get'
      data: company_id: @value
    return
  return