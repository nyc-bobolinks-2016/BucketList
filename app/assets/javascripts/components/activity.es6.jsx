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
        updated_at:""
      }
    }
  }

  componentDidMount(){
    debugger
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
debugger
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
  url:"/activities/"+id+"/votes",
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
  url:"/activities/"+id+"/votes",
  method: "post",
  data:{voteType: "up"}
}).done((response) => {
  this.setState({
    activity: response
  })
})
}



  render(){
    return(
      <div>
        <p>{this.state.activity.title}</p>
        <div className="">
          <form id="form_down" onClick={(event) => this.downActivity(event)}>
            <button ref="down" className="btn-floating btn-large waves-effect waves-light red"><i className="material-icons">thumb_down</i></button>
          </form>
          <form id="form_pass" onClick={(event) => this.passActivity(event)}>
            <button ref="" className="btn-floating btn-large waves-effect waves-light blue"><i className="material-icons">swap_horiz</i></button>
          </form>
          <form id="form_up" onClick={(event) => this.upActivity(event)}>
            <button ref="up" className="btn-floating btn-large waves-effect waves-light green"><i className="material-icons">thumb_up</i></button>
          </form>
        </div>
      </div>
    )
  }
}
