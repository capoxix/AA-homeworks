import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// function addLoggingToDispatch(store){
//   let dispatch = store.dispatch;
//   return function(action){
//     console.log(store.getState());
//     console.log(action);
//     dispatch(action);
//     console.log(store.getState());
//   };
// }


// const addLoggingToDispatch = store => next => action => {
//   // your code here
//   console.log(store.getState());
//   console.log(action);
//   next(action);
//   console.log(store.getState());
// };
//
// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });
//   return Object.assign({}, store, { dispatch });
// };

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
  JSON.parse(localStorage.state) : {};
   const store = configureStore(preloadedState);
  // store = applyMiddlewares(store, addLoggingToDispatch);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
