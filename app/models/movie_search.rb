class MovieSearch
  def search(query)
    text = CGI.escape(query.downcase)
    first_letter = text.first

    uri = URI("https://sg.media-imdb.com/suggests/#{first_letter}/#{text}.json")
    Rails.logger.info(uri)
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      response_body = response.body
      # remove everything up to first { and after last }
      cleaned_response_body = response_body.match(/\{.*\}/).to_s
      top_result = JSON.parse(cleaned_response_body)["d"].first
      return top_result.except("v")
    end
    return {}
  end
end
