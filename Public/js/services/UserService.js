import Router from '../api/Router.js';

const Routers = {
    auth: Router('auth'),
    user: Router('users')
};

export default Routers;