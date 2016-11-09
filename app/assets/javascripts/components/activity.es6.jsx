class Activity extends React.Component{
  constructor(){
    super()
    this.state = {
      activity:{
        ag:0,
        co:0,
        created_at:"",
        ex:0,
        id:1,
        ne:0,
        op:0,
        title:"",
        updated_at:"",
        img_url:""
      }
    }
  }


  componentWillMount(){
    $.ajax({
      url: '/activities',
      method: "get"
    }).done((response) => {
      this.setState({
        activity: response,
        disabled: false
      })
    })
  }

  downActivity(){
    var route = "/activities/"+this.state.activity.id+"/votes"
    this.setState.disabled = false
    $.ajax({
      url:route,
      method: "post",
      data:{voteType: "down"}
    }).done((response) => {
      this.setState({
        activity: response
      })
      this.setState.disabled = true
    })
  }

  passActivity(){
    var id = this.props.activity_id
        this.setState.disabled = false
    $.ajax({
      url:"/activities/"+this.state.activity.id+"/votes",
      method: "post",
      data:{voteType: "pass"}
    }).done((response) => {
      this.setState({
        activity: response
      })
    this.setState.disabled = true
    })
  }

  upActivity(){
    var id = this.props.activity_id
        this.setState.disabled = false
    $.ajax({
      url:"/activities/"+this.state.activity.id+"/votes",
      method: "post",
      data:{voteType: "up"}
    }).done((response) => {
      this.setState({
        activity: response
      })
            this.setState.disabled = true
    })
  }

  doneActivity(){
    var id = this.props.activity_id
        this.setState.disabled = false
    $.ajax({
      url:"/activities/"+this.state.activity.id+"/votes",
      method: "post",
      data:{voteType: "done"}
    }).done((response) => {
      this.setState({
        activity: response
      })
            this.setState.disabled = true
    })
  }



  render(){
    return(
      <div className="container col 12">
        <div className="center col 12">
          <h3>{this.state.activity.title}</h3>
        </div>
        <div className="row">

        </div>
        <div className="center col 12">
            <img src={this.state.activity.img_url}  className="circle responsive-img white z-depth-5"  />
        </div>
        <div className="row">
        </div>
        <div className="row">
        </div>
        <div className="row">
        </div>
        <div className="row col 12 ">
          <div className="col  s3 m3 l3 center">
            <a ref="down" onClick={(event) => this.downActivity(event)}
                disabled={this.state.disabled}
                className="btn-floating btn-large waves-effect waves-light red darken-3 hoverable tooltipped" data-delay="50" data-tooltip="No">
              <i className="material-icons">thumb_down</i>
            </a>
          </div>
          <div className="col s3 m3 l3 center">
            <a ref="pass" onClick={(event) => this.passActivity(event)}
                disabled={this.state.disabled}
                className="btn-floating btn-large waves-effect waves-light light-blue lighten-2 hoverable tooltipped" data-delay="50" data-tooltip="Pass">
              <i className="material-icons">swap_horiz</i>
            </a>
          </div>
          <div className="col  s3 m3 l3 center">
            <a ref="done" onClick={(event) => this.doneActivity(event)}
                disabled={this.state.disabled}
                className="btn-floating btn-large waves-effect waves-light  orange lighten-1 hoverable tooltipped" data-delay="50" data-tooltip="I've done this already">
              <i className="material-icons">done</i>
            </a>
          </div>
          <div className="col  s3 m3 l3 center">
            <a ref="up" onClick={(event) => this.upActivity(event)}
                disabled={this.state.disabled}
                className="btn-floating btn-large waves-effect waves-light green hoverable tooltipped" data-delay="50" data-tooltip="Add to List">
              <i className="material-icons">thumb_up</i>
            </a>
          </div>
        </div>
      </div>
    )
  }
}
