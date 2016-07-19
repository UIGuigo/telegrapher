import React, { Component } from 'react';
import {
  AppRegistry,
  Text,
  View
} from 'react-native';

import Calculator from './common/Calculator.js';

class telegrapher extends Component {
  render() {
    return (
      <Calculator/>
    );
  }
}

AppRegistry.registerComponent('telegrapher', () => telegrapher);
