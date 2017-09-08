import React from 'react';
import ReactDOM from 'react-dom';
import HelloWorld from './hello_world';
import Calculator from './calculator';

document.addEventListener("DOMContentLoaded", () => {
	const calcEntry = document.getElementById("calculator");

	ReactDOM.render(<Calculator/>, calcEntry);
});
