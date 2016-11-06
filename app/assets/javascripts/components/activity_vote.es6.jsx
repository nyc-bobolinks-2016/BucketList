class ActivityVote extends React.Component{

  constructor(){
    super()
    this.state = {
      activity:[]
    }
  }

  render(){
  debugger
  return(
    <div>
      <Activity activity_id = {this.props.activity_id}/>
    </div>
  )
}
}
