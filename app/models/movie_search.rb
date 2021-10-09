class MovieSearch
  def search(query)
    text = CGI.escape(query.downcase)
    first_letter = text.first
    uri = build_uri(query)

    Rails.logger.info(uri)

    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      response_body = response.body
      # remove everything up to first { and after last }
      cleaned_response_body = response_body.match(/\{.*\}/).to_s
      # 'd' is key for data
      results = JSON.parse(cleaned_response_body)["d"]
      # exclude unnecessary 'v'
      new_results = results.map {|r| r.except('v')}
      # ensure results have images
      image_results = new_results.select {|r| r.has_key?('i')}
      # only return films (exclude video games)
      film_results = image_results.select {|r| r['q'] == 'feature'}
      return film_results
    end
    return {}
  end

  private

  def build_uri(query)
    text = CGI.escape(query.downcase)
    first_letter = text.first
    return URI("https://sg.media-imdb.com/suggests/#{first_letter}/#{text}.json")
  end
end
