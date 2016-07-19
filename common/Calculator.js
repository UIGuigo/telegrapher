'use strict';

import React from 'react';
import {
  Text,
  View,
  NativeModules,
} from 'react-native';

var { CalculatorModule } = NativeModules;

class Calculator extends React.Component {

  constructor(props) {
    super(props)

    this.name = 'Danilo',
    this.result = 0
    // this.result = 0,
    // this.left = 0,
    // this.right = 0,
    // this.operation = ''
  }

  resetResults() {
    CalculatorModule.resetResults((error, reset) => {
      if (error) {
        console.error(error);
      } else {
        this.result = 0;
        console.log(this.result);
      }
    });
  }

  componentDidMount() { /* Launches upon creation of Component */

    // RCT_EXPORT_METHOD(string) example
    CalculatorModule.greet(this.name);

    // Callback example
    CalculatorModule.findEvents((error, events) => {
      if (error) {
        console.error(error);
      } else {
        this.setState({events: events});
        console.log(events);
      }
    });
  }

  render() { /* Can we ignore the render method? Ghost views? Gross */
    return (
      <View>
        <Text>{this.props.name}</Text>
      </View>
    );
  }
}

module.exports = Calculator;
