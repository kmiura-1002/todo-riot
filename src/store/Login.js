import riotx from 'riotx'
import LoginTypes from './LoginTypes'

const authStore = new riotx.Store({
  name: 'auth-store',
  state: {
    auth: {
      isSignin: false,
      user: {
        id: '',
        name: ''
      },
      error: ''
    }
  },
  mutations: {
    [LoginTypes.SIGNIN](context, auth) {
      context.state.auth = Object.assign({}, auth)
      return ['changed']
    },
    [LoginTypes.SIGNOUT](context) {
      context.state.auth = {
        isSignin: false,
        user: {
          id: '',
          name: ''
        },
        error: ''
      }
      return ['changed']
    }
  },
  actions: {
    [LoginTypes.SIGNIN]: (context, login) => {
      const jwt = 'jsonWebToken'
      localStorage.setItem('jwt', jwt)
      const auth = {}
      auth.isSignin = true
      auth.user = {}
      auth.user.id = login.id

      console.log(login)
      console.log(auth)
      context.commit(LoginTypes.SIGNIN, Object.assign({}, auth))
    },
    [LoginTypes.SIGNOUT]: context => {
      localStorage.removeItem('jwt')

      context.commit(LoginTypes.SIGNOUT)
    }
  },
  getters: {
    auth: (context, data) => context.state.auth
  }
})

authStore.change('changed', (state, store) => {
  console.log(`state:${JSON.stringify(state)}, store:${JSON.stringify(store)}`)
})
export default authStore
