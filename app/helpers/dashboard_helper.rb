module DashboardHelper
    def type(record)
        record.class == Income ? 'Income' : 'Expense'
    end

    def date_with_format(date)
        date.strftime('%b %d, %Y')
    end
end
