import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';

class Red extends React.Component {
  render() {

    const { props: { match: { path }}} = this;
    return(
      <div>
        <h2 className="red"></h2>
        {/* Links here */}

        {/* Routes here */}
        <Route path={`${path}/orange`} component={Orange} />
        <Route path={`${path}/yellow`} component={Yellow} />
      </div>
    );
  }
};

export default Red;
