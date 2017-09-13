import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import APIUtils from './util/api_util';
import { fetchSearchGiphys, RECEIVE_SEARCH_GIPHYS, receiveSearchGiphys } from './actions/giphy_actions';

document.addEventListener('DOMContentLoaded', function(){
    const store = configureStore();
    window.store = store;
    window.APIUtils = APIUtils;
    window.RECEIVE_SEARCH_GIPHYS = RECEIVE_SEARCH_GIPHYS;
    window.receiveSearchGiphys = receiveSearchGiphys;
    window.fetchSearchGiphys = fetchSearchGiphys;

});
