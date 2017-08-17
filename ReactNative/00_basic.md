Basic
=====

## Install React Native and Init project




## Connect to Your Android Device

ref: https://facebook.github.io/react-native/docs/running-on-device.html


For Android version above 5.0

```
adb reverse tcp:8081 tcp:8081
```

For Android version under 5.0

...?


## Hello World app

```javascript
import React, { Component } from 'react';
import { AppRegistry, Text } from 'react-native';

export default class MyProject extends Component {
  render() {
    return (
      <Text>Hello world!</Text>
    );
  }
}

// skip this line if using Create React Native App
AppRegistry.registerComponent('AwesomeProject', () => MyProject);
```


#### Component

The only thing that's required is a render function which returns some JSX to render.


#### AppRegistry.

The AppRegistry just tells React Native which component is the root one for the whole application.

## Props

- Most components can be customized when they are created, with different parameters. These creation parameters are called props.
- Set by the parent and they are fixed throughout the lifetime of a component

```javascript
import React, { Component } from 'react';
import { AppRegistry, View, Text, Image } from 'react-native';



class MyImage extends Component {
  render() {
    return (
      <View style={{alignItems: 'center'}}>
          <Text> Hello {this.props.name} </Text>
          <Image source={this.props.src} style={{width: 200, height: 100}}/>
      </View>
    );
  }
}


export default class Bananas extends Component {
  render() {
    let default_name = 'Okinawa';
    return (
      <View style={{alignItems: 'center'}}>
          <MyImage src={{ uri: 'http://www.japan-guide.com/thumb/XYZeXYZe7109_375.jpg'}} name={default_name}/>
          <MyImage src={{ uri: 'http://www.petitwedding-en.com/okinawa/img/gallery/02.jpg'}} name='wedding'/>
          <MyImage src={{ uri: 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAALHAAAAJDcxNDVjYjc3LWJkZjYtNDE2Yi05NTY1LWYyNjBjODBmNDk4OA.jpg'}} name='TsungYi'/>
      </View>
    );
  }
}


// skip this line if using Create React Native App
AppRegistry.registerComponent('AwesomeProject', () => Bananas);

```


## State

- For data that is going to change
- Initialize state in the constructor, and then call setState when you want to change it.

```javascript
import React, { Component } from 'react';
import { AppRegistry, View, Text, Image } from 'react-native';


class BlinkImage extends Component {
  constructor(props) {
    super(props);
    this.state = {show: true};

    // Toggle the state every second
    setInterval(() => {
      this.setState( previousState => {
        return { show: !previousState.show };
      });
    }, 1000);
  }

  render() {
    let src = this.state.show ? this.props.src1 : this.props.src2;
    return (
      <Image source={src} style={{width: 200, height: 100}}/>
    );
  }
}

export default class Bananas extends Component {
  render() {
    let default_name = 'Okinawa';
    return (
      <View style={{alignItems: 'center'}}>
          <BlinkImage src1={{ uri: 'http://www.japan-guide.com/thumb/XYZeXYZe7109_375.jpg'}}
                   src2={{ uri: 'http://www.petitwedding-en.com/okinawa/img/gallery/02.jpg'}}
          />
          <BlinkImage
               src1={{ uri: 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAALHAAAAJDcxNDVjYjc3LWJkZjYtNDE2Yi05NTY1LWYyNjBjODBmNDk4OA.jpg'}}
               src2={{ uri: 'http://imgs.niusnews.com/upload/imgs/default/16OctE/jen28/1.jpg'}}
          />
      </View>
    );
  }
}


// skip this line if using Create React Native App
AppRegistry.registerComponent('AwesomeProject', () => Bananas);

```
