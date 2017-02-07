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
  

  vote(event,action){
    var route = "/activities/"+this.state.activity.id+"/votes"
    $.ajax({
      url:route,
      method: "post",
      data:{voteType: action}
    }).done((response) => {
      this.setState({
        activity: response
      })
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
          <VoteButton tooltip={"No"} onClick={this.vote.bind(this)} tumb_icon={"thumb_down"} action={"down"} color={"red darken-3"}/>
          <VoteButton tooltip={"Pass"} onClick={this.vote.bind(this)} tumb_icon={"swap_horiz"} action={"pass"} color={"light-blue lighten-2"}/>
          <VoteButton tooltip={"I've done this already"} onClick={this.vote.bind(this)} tumb_icon={"done"} action={"done"} color={"orange lighten-1"}/>
          <VoteButton tooltip={"Up"} onClick={this.vote.bind(this)} tumb_icon={"thumb_up"} action={"up"} color={"green"}/>
        </div>
      </div>
    )
  }
}
