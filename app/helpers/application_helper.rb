module ApplicationHelper
  def formatted_datetime date
    date.strftime '%d/%m/%y %H:%M %p'
  end

  def formatted_date date
    date.strftime '%d/%m/%y'
  end

end
