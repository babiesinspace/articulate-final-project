require 'json'
class SpeechResultsController < ApplicationController
  include SpeechResultsHelper

  def index
  end

  def show
    # speech = {
    #   "document_tone": {
    #     "tone_categories": [
    #       {
    #         "tones": [
    #           {
    #             "score": 0.122074,
    #             "tone_id": "anger",
    #             "tone_name": "Anger"
    #           },
    #           {
    #             "score": 0.466388,
    #             "tone_id": "disgust",
    #             "tone_name": "Disgust"
    #           },
    #           {
    #             "score": 0.162443,
    #             "tone_id": "fear",
    #             "tone_name": "Fear"
    #           },
    #           {
    #             "score": 0.542211,
    #             "tone_id": "joy",
    #             "tone_name": "Joy"
    #           },
    #           {
    #             "score": 0.225703,
    #             "tone_id": "sadness",
    #             "tone_name": "Sadness"
    #           }
    #         ],
    #         "category_id": "emotion_tone",
    #         "category_name": "Emotion Tone"
    #       },
    #       {
    #         "tones": [
    #           {
    #             "score": 0.867915,
    #             "tone_id": "analytical",
    #             "tone_name": "Analytical"
    #           },
    #           {
    #             "score": 0,
    #             "tone_id": "confident",
    #             "tone_name": "Confident"
    #           },
    #           {
    #             "score": 0.664434,
    #             "tone_id": "tentative",
    #             "tone_name": "Tentative"
    #           }
    #         ],
    #         "category_id": "language_tone",
    #         "category_name": "Language Tone"
    #       },
    #       {
    #         "tones": [
    #           {
    #             "score": 0.694488,
    #             "tone_id": "openness_big5",
    #             "tone_name": "Openness"
    #           },
    #           {
    #             "score": 0.68608,
    #             "tone_id": "conscientiousness_big5",
    #             "tone_name": "Conscientiousness"
    #           },
    #           {
    #             "score": 0.500131,
    #             "tone_id": "extraversion_big5",
    #             "tone_name": "Extraversion"
    #           },
    #           {
    #             "score": 0.287042,
    #             "tone_id": "agreeableness_big5",
    #             "tone_name": "Agreeableness"
    #           },
    #           {
    #             "score": 0.315252,
    #             "tone_id": "emotional_range_big5",
    #             "tone_name": "Emotional Range"
    #           }
    #         ],
    #         "category_id": "social_tone",
    #         "category_name": "Social Tone"
    #       }
    #     ]
    #   }
    # }
    respond_to do |format|
      format.html #{ redirect_to 'index' }
      format.json { render json: speech}
    end
  end

  def create
    @user = User.find(params[:user_id])
    tone_response = get_tone(params[:text])
    @speech_result = SpeechResult.new(transcript: text, user: @user)
    @speech_result.save

    # Parsing tone analyzer

    @doc_emotion = DocEmotion.new(speech_result: @speech_result)
    emotion_array = tone_response["document_tone"]["tone_categories"][0]["tones"]
    parse_tone_result(emotion_array, @doc_emotion)
    @speech_result.doc_emotion = @doc_emotion
    @doc_emotion.save

    @doc_language_tone = DocLanguageTone.new(speech_result: @speech_result)
    language_tone_array = tone_response["document_tone"]["tone_categories"][1]["tones"]
    parse_tone_result(language_tone_array, @doc_language_tone)
    @speech_result.doc_language_tone = @doc_language_tone
    @doc_language_tone.save

    @doc_social_tone = DocSocialTone.new(speech_result: @speech_result)
    social_tone_array = tone_response["document_tone"]["tone_categories"][2]["tones"]
    parse_tone_result(social_tone_array, @doc_social_tone)
    @speech_result.doc_social_tone = @doc_social_tone
    @doc_social_tone.save

    # Parsing Alchemy

    alchemy_response = get_alchemy_results(text)

    alchemy_response["taxonomies"].map do |taxonomy|
      Taxonomy.create(speech_result: @speech_result, confident: taxonomy["confident"], label: taxonomy["label"], score: taxonomy["score"])
    end

    alchemy_response["keywords"].map do |keyword|
      Keyword.create(speech_result: @speech_result, relevance: keyword["relevance"], sentiment_score: keyword["sentiment"]["score"], sentiment_type: keyword["sentiment"]["type"], text: keyword["text"])
    end

    # format JSON here
  end

  protected
    def speech_result_params
      params.require(:speech_result).permit(:transcript)
    end

end
