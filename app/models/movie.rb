class Movie < ApplicationRecord
  def to_s
    "#{title} (#{year})"
  end

  def display_link

  end
end
