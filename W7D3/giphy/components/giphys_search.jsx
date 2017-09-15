import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
    constructor(props){
        super(props);
        this.state = {
          term: '',
          pictures: []
        }
    }

    handleChange(e){
      e.preventDefault();
      this.setState({
        term: e.target.value
      })
    }

    handleSubmit(e){
      e.preventDefault()
      const { fetchSearchGiphys } = this.props;

      this.setState ({
          term: ''
      })

      fetchSearchGiphys(this.state).then(
        giphys => {
          this.setState({
            pictures: giphys.giphys
          })
        }
      )
    }

    render(){
        return (
          <main>
            <form onSubmit={this.handleSubmit.bind(this)}>
              <input type="text" onChange={this.handleChange.bind(this)}
                     value={this.state.term} />
              <input type="submit" onSubmit={this.handleSubmit.bind(this)}
                      value="Get Giphys" />
            </form>
            <GiphysIndex giphys={this.state.pictures} />
          </main>
        )
    }
}

export default GiphysSearch;
