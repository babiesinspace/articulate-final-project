class BubbleChart extends React.Component {
  constructor(){
    super();
    this.state = {
        emotion_tone: [],
        language_tone: [],
        social_tone: [],
        data: [],
    }

    this.createChartAll = this.createChartAll.bind(this)
  }
  componentDidMount(){
    var that = this
    $.ajax({
      url: '/json_test',
      dataType: "json"
    }).done(function(response){
      that.setState({
        emotion_tone: response.doc_emotion,
        language_tone: response.doc_language_tone,
        social_tone: response.doc_social_tone,
      })
        setTimeout(that.createChartAll, 0)
    })
  }

  createChartAll(){
    var chart = new CanvasJS.Chart("chartContainer",
      {
    //    zoomEnabled: true,
    //    animationEnabled: true,
    //    title:{
    //     text: "Fertility Rate Vs Life Expectancy in different countries - 2009"
    //   },
    //   axisX: {
    //    title:"Life Expectancy",
    //    maximum: 30
    //  },
    //  axisY: {
    //    title:"Fertility Rate"
     //
    //  },
     //
    //  legend:{
    //    verticalAlign: "bottom",
    //    horizontalAlign: "left"
     //
    //  },
     data: [
     {
       type: "bubble",
       showInLegend: false,
       toolTipContent: "<span style='\"'color: {color};'\"'><strong>{name}</strong></span><br/><strong>Confidency: {score}</strong><br/>",
       dataPoints: [

        { x: 16, y: 25, z:this.state.emotion_tone["anger"]*100, name: "Anger", score: this.state.emotion_tone["anger"] },
        { x: 19, y: 17, z:this.state.emotion_tone["disgust"]*100, name: "Disgust", score:this.state.emotion_tone["disgust"] },
        { x: 15, y: 10, z:this.state.emotion_tone["fear"]*100, name: "Fear", score: this.state.emotion_tone["fear"] },
        { x: 18, y: 6, z:this.state.emotion_tone["joy"]*100, name: "Joy", score: this.state.emotion_tone["joy"] },
        { x: 7, y: 12, z:this.state.emotion_tone["sadness"]*100, name: "Sadness", score:this.state.emotion_tone["sadness"]},

        { x: 10, y: 14, z:this.state.language_tone["analytical"]*100, name: "Analytical", score:this.state.language_tone["analytical"] },
        { x: 5, y: 20, z:this.state.language_tone["confident"]*100, name: "Confident", score: this.state.language_tone["confident"] },
        { x: 12, y: 10, z:this.state.language_tone["tentative"]*100, name: "Tentative", score: this.state.language_tone["tentative"]},

        { x: 9, y: 5, z:this.state.social_tone["agreeableness"]*100, name: "Openness", score: this.state.social_tone["agreeableness"] },
        { x: 11, y: 20, z:this.state.social_tone["conscientiousness"]*100, name: "Conscientiousness", score: this.state.social_tone["conscientiousness"] },
        { x: 5, y: 4, z:this.state.social_tone["emotional_range"]*100, name: "Extraversion", score: this.state.social_tone["emotional_range"] },
        { x: 14, y: 26, z:this.state.social_tone["extraversion"]*100, name: "Agreeableness", score: this.state.social_tone["extraversion"] },
        { x: 20, y: 4, z:this.state.social_tone["openness"]*100, name: "Emotional Range", score: this.state.social_tone["openness"] }
        ]
      }
      ]
    });

 chart.render();
 }

  render(){
    return(  <div id="chartContainer"></div>)
  }
}
