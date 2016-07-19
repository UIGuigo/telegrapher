'use strict';

import React, { 
  NativeModules, 
  Text 
} from 'react';

var { CalculatorModule } = require('NativeModules');

var Calculator = React.createClass({
  getInitialState() {
    return { 	
	text: 'Goodbye World.',
	result: 0,
	left: 0,
	right: 0,
	operation: '' 
    };
  },
  componentDidMount() {
    NativeModules.CalculatorModule.processString(this.state.text, (text) => {
      this.setState({text});
    });
    
    NativeModules.CalculatorModule.genericOperation(this.state.left, this.state.operation, this.state.right, (result) => {
       this.setState({result});
    });
  },
  render: function() {
    return (
      <Text>{this.state.text}</Text>
    );
  }
});

module.exports = Calculator;
