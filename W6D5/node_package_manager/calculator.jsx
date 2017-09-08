import React from 'react';

// undo
// redo

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
		this.state = ({
			num1: 0,
			num2: 0,
			result: '',
			history: [] // will store n1, n2 and operation
		})

		this.setNum1 = this.setNum1.bind(this)
		this.setNum2 = this.setNum2.bind(this)
		this.calc = this.calc.bind(this)
		this.operators = this.operators.bind(this)
		this.undo = this.undo.bind(this)
  }

  // your code here
	setNum1(e){
		this.setState({ num1: parseInt(e.target.value) })
		e.target.value = ""
	}

	setNum2(e){
		this.setState({ num2: parseInt(e.target.value) })
		e.target.value = ""
	}

	calc(op){
		this.setState({
			history: this.state.history.concat(Object.assign({}, this.state)),
			result: this.operators(op.target.value)(this.state.num1, this.state.num2)
		});
	}

	undo(){
		const lastState = this.state.history[this.state.history.length - 1];
		const {num1, num2, result} = lastState;

		this.setState({
			num1, 
			num2,
			result,
			history: this.state.history.slice(0, this.state.history.length - 1)
		})
	}

		operators(op){ 
			return ({
							"+": (a, b) => (a + b),
							"-": (a, b) => (a - b),
							"/": (a, b) => (a / b),
							"**": (a, b) => Math.pow(a, b),
							"*": (a, b) => (a * b)
							})[op] || (() => 0)
		}

	renderUndo(){
		if (this.state.history.length == 0){
			return <div></div>
		}

		return (
			<div>
				<button onClick={this.undo}>Undo</button>
			</div>
		);
	}

  render() {
    return (
      <div>
        <h1>Result: {this.state.result}</h1>
				{' '}
				<div>
					<input value={this.state.num1} type="number" id="one" onChange={this.setNum1}></input>
					<input value={this.state.num2} type="number" id="two" onChange={this.setNum2}></input>
				</div>
				{' '}
				<div>
					<button value="+" onClick={this.calc.bind("+")}>+</button>
					<button value="-" onClick={this.calc.bind("-")}>-</button>
					<button value="*" onClick={this.calc.bind("*")}>*</button>
					<button value="/" onClick={this.calc.bind("/")}>/</button>
					<button value="**" onClick={this.calc.bind("**")}>**</button>
				</div>
				{' '}
				{this.renderUndo()}
      </div>
    );
  }
}

export default Calculator;
