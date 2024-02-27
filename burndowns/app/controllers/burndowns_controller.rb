# class BurndownsController < ApplicationController
#   def index
#     @burndowns = Burndown.all
#     @versions = Version.order(id: :desc)

#     # If the form is submitted, calculate issues_count_per_day
#     if params[:version_id].present? && params[:start_date].present? && params[:end_date].present?
#       version_id = params[:version_id]
#       start_date = Date.parse(params[:start_date]) rescue 1.month.ago.to_date
#       end_date = Date.parse(params[:end_date]) rescue Date.today

#       # Query the database to count issues per day within the date range
#       issues_count_per_day = Issue.where(fixed_version_id: version_id)
#                                   .where(start_date: start_date..end_date)
#                                   .count

#       @json = issues_count_per_day
#     end
#   end
# end

class BurndownsController < ApplicationController
  def index
    @burndowns = Burndown.all
    @versions = Version.order(id: :desc)
    @default_version = '5.0.8'
    default_version_record = @versions.find_by(name: @default_version)
    @selected_version_id = default_version_record&.id

    if params[:version_id].present? && params[:start_date].present? && params[:end_date].present?
      version_id = params[:version_id]
      start_date = Date.parse(params[:start_date]) rescue 1.month.ago.to_date
      end_date = Date.parse(params[:end_date]) rescue Date.today

      # Query the database to count issues per day within the date range
      issues_per_day = Issue.where(fixed_version_id: version_id)
                           .where(start_date: start_date..end_date)
                           .group("DATE(start_date)")
                           .count

      # Prepare data for ApexCharts
      @issues_count_per_day = issues_per_day.map { |date, count| [date.to_date, count] }.to_h
    end
  end
end

