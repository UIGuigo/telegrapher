'use strict';

import React from 'react';
import {
  Text,
  View,
  NativeModules,
} from 'react-native';

var { NetworkRequestBridge } = NativeModules;

class NetworkRequest extends React.Component {

  constructor(props) {
    super(props)

    this.state = {
      isLoading: false,
      message: '',
      result: 0
    };

    this.name = 'Danilo'
    // this.left = 0,
    // this.right = 0,
    // this.operation = ''
  }

  resetResults() {
    CalculatorBridge.resetResults((error, reset) => {
      if (error) {
        console.error(error);
      } else {
        this.state.result = 0;
        console.log(this.state.result);
      }
    });
  }

  // Example - create API url
  _urlForQueryAndPage(key, value, pageNumber) {
    var data = {
      country: 'uk',
      pretty: '1',
      encoding: 'json',
      listing_type: 'buy',
      action: 'search_listings',
      page: pageNumber
    };

    data[key] = value;

    var querystring = Object.keys(data)
      .map(key => key + '=' + encodeURIComponent(data[key]))
      .join('&');

    return 'http://api.nestoria.co.uk/api?' + querystring;
  };

  // Example - Fire off request
  _executeQuery(query) {
    console.log(query);
    this.setState({ isLoading: true });

    fetch(query)
    .then(response => response.json())
    .then(json => this._handleResponse(json.response))
    .catch(error =>
      this.setState({
        isLoading: false,
        message: 'Something bad happened ' + error
      }));
  }

  // Example - Handle response
  _handleResponse(response) {
    this.setState({ isLoading: false , message: '' });
    if (response.application_response_code.substr(0, 1) === '1') {
      console.log('Properties found: ' + response.listings.length);
    } else {
      var errorMessage = 'Location not recognized; please try again';
      console.log(errorMessage);
      this.setState({ message: errorMessage});
    }
  }

  componentDidMount() { /* Launches upon creation of Component */

    // Fire off asynch request
    var query = this._urlForQueryAndPage('centre_point', 'london', 1);
    this._executeQuery(query);

    // RCT_EXPORT_METHOD(string) example
    CalculatorBridge.greet(this.name);

    // Callback example
    CalculatorBridge.findEvents((error, events) => {
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
