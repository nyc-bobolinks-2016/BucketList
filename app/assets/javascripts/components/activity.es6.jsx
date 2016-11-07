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

  componentDidMount(){
    var id = this.props.activity_id
    $.ajax({
    url:"/activities/"+id,
    method: "get"
  }).done((response) => {
    this.setState({
      activity: response
    })
  })
 }

downActivity(){
  var route = "/activities/"+this.state.activity.id+"/votes"
  $.ajax({
  url:route,
  method: "post",
  data:{voteType: "down"}
}).done((response) => {
  this.setState({
    activity: response
  })
})
}

passActivity(){
  var id = this.props.activity_id
  $.ajax({
  url:"/activities/"+this.state.activity.id+"/votes",
  method: "post",
  data:{voteType: "pass"}
}).done((response) => {
  this.setState({
    activity: response
  })
})
}

upActivity(){
  var id = this.props.activity_id
  $.ajax({
  url:"/activities/"+this.state.activity.id+"/votes",
  method: "post",
  data:{voteType: "up"}
}).done((response) => {
  this.setState({
    activity: response
  })
})
}

doneActivity(){
  var id = this.props.activity_id
  $.ajax({
  url:"/activities/"+this.state.activity.id+"/votes",
  method: "post",
  data:{voteType: "done"}
}).done((response) => {
  this.setState({
    activity: response
  })
})
}



  render(){
    return(
      <div>
        <img src={this.state.activity.img_url}  className="circle responsive-img white "  />
        <p>{this.state.activity.title}</p>
        <div className="">
            <a ref="down" onClick={(event) => this.downActivity(event)} className="btn-floating btn-large waves-effect waves-light red"><i className="material-icons">thumb_down</i></a>
            <a ref="" onClick={(event) => this.passActivity(event)} className="btn-floating btn-large waves-effect waves-light blue"><i className="material-icons">swap_horiz</i></a>
            <a ref="done" onClick={(event) => this.doneActivity(event)} className="btn-floating btn-large waves-effect waves-light yellow"><i className="material-icons">done</i></a>
            <a ref="up" onClick={(event) => this.upActivity(event)} className="btn-floating btn-large waves-effect waves-light green"><i className="material-icons">thumb_up</i></a>
        </div>
      </div>
    )
  }
}
