import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        {/* Your links should go here */}
        <NavLink to='/green'>Green</NavLink>
        <NavLink exact={true} to='/red'>Red</NavLink>
        <NavLink exact={true} to='/blue'>Blue</NavLink>
        <NavLink exact={true} to='/violet'>Violet</NavLink>
        <NavLink to='/blue/indigo'>Add Indigo</NavLink>
        <NavLink to='/red/yellow'>Add Yellow</NavLink>
        <NavLink to='/red/orange'>Add Orange</NavLink>

        <div id="rainbow">
          {/* Your routes should go here */}
            <Route path="/red" component={Red} />
            <Route path="/green" component={Green} />
            <Route path="/blue" component={Blue} />
            <Route path="/violet" component={Violet} />
        </div>
      </div>
    );
  }
};

export default Rainbow;
