class VoteButton extends React.Component{

  constructor(){
    super()
    this.state = {
        disabled:false
    }

  }

  handleClick(){
    this.setState({
      disabled:true
    })

    this.props.onClick(event,this.props.action);

    this.setState({
      disabled:false
    })

  }

  render(){
    return(
      <div className="col  s3 m3 l3 center">
        <a ref="down" onClick={(e) => this.handleClick()}
            disabled={this.state.disabled}
            className={"btn-floating btn-large waves-effect waves-light " + this.props.color +   " hoverable tooltipped"} data-delay="50" data-tooltip={this.props.tooltip}>
          <i className="material-icons">{this.props.tumb_icon}</i>
        </a>
      </div>
    )
  }
}
