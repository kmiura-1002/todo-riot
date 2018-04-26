import riot from 'riot'
import route from 'riot-route/lib/tag'
import riotRoute from 'riot-route'
import riotx from 'riotx'
import todoStore from './store/Todo'
import authStore from './store/Login'
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min.js'

import './app.tag'
import './style.css'

riotx.debug(process.env.NODE_ENV === 'development');
riotx.add(todoStore)
riotx.add(authStore)
riot.mount('app')
riotRoute.base('/app')