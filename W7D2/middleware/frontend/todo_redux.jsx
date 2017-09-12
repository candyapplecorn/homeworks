import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

const addLoggingToDispatch = store => next => action => {
		console.log(action)
		console.log(store.getState())
		const result = next(action)
		console.log(store.getState())
		//return result;
};

const applyMiddlewares = (store, ... middlewares) => {
	let { dispatch } = store;
	middlewares.forEach(mw => {
		dispatch = mw(store)(dispatch);

		if (mw == addLoggingToDispatch){ console.log(dispatch) }
	});
	return Object.assign({}, store, { dispatch })
}


document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

	//store.dispatch = addLoggingToDispatch(store);
	//store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
