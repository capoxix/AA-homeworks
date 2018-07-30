import { createStore, applyMiddleware } from 'redux';
import rootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer,
    preloadedState,
    applyMiddleware(addLoggingToDispatch, anotherMiddleWare)
);
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;

//applyMiddleware calls addLoggingToDispatch then passess
//value into anotherMiddleware and then returns result
const addLoggingToDispatch = store => next => action => {
  // your code here
  console.log(store.getState());
  console.log(action);
  next(action);
  console.log(store.getState());
};

const anotherMiddleWare = store => next => action => {
  console.log("the other middleware");
  next(action);
};
