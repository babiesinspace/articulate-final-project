module SpeechResultsHelper

  def parse_result(array, target)
    array.map {|tone| target.write_attribute(tone["tone_name"].downcase.split.join('_').to_sym, tone["score"])}
  end

  def get_tone(text)
    tone_endpoint = "https://#{ENV["WATSON_TONE_USER"]}:#{ENV["WATSON_TONE_PW"]}@gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19&text=#{text}"
    response = JSON.parse(RestClient.get(tone_endpoint))
    # language_tone_array = response["document_tone"]["tone_categories"][1]["tones"]
    # social_tone_array = response["document_tone"]["tone_categories"][2]["tones"]
  end

end