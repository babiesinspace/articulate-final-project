class Evaluation extends React.Component {
  constructor() {
    super()
  }

  getStrongEmotion(emotion) {
    return this.props.data.doc_emotion[emotion] > .5
  }

  getStrongSocialTone(tone) {
    return this.props.data.doc_social_tone[tone] > .8
  }

  getStrongLanguageTone(tone) {
    return this.props.data.doc_language_tone[tone] > .8
  }

  render() {
    let strongEmotions = Object.keys(this.props.data.doc_emotion).filter(this.getStrongEmotion.bind(this))
    let strongSocialTones = Object.keys(this.props.data.doc_social_tone).filter(this.getStrongSocialTone.bind(this))
    let strongLanguageTones = Object.keys(this.props.data.doc_language_tone).filter(this.getStrongLanguageTone.bind(this))

    return (
      <div className="evaluation">
        <p>Your speech may be perceived as {this.props.data.personality_profile.join(', ')}</p>
        <p>Emotions: This speech ranks high in {strongEmotions.join(', ')}</p>
        <p>Social Tone: This speech ranks high in {strongSocialTones.join(', ')}</p>
        <p>Language Tone: This speech ranks high in {strongLanguageTones.join(', ')}</p>
      </div>
    )
  }
}
