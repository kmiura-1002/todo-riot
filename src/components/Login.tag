<login>
    <div>
        <form class="form-signin text-center" onSubmit={login}>
            <h1 class="h3 mb-3 font-weight-normal">Please Login</h1>
            <label for="id" class="sr-only">Email address</label>
            <input type="email" name="id" id="id" onchange={ handleInputChange } class="form-control" placeholder="Email address" required="" autofocus/>
            <label for="pass" class="sr-only">Password</label>
            <input type="password" name="pass" id="pass" onchange={ handleInputChange } class="form-control" placeholder="Password" required="" />
            <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
            <p class="mt-5 mb-3 text-muted">© 2017-2018</p>
        </form>
    </div>
    <script>
        import LoginTypes from '../store/LoginTypes'
        import riotRoute from 'riot-route'

        const store = this.riotx.get('auth-store')
        const self = this
        self.user = {
            id: -1,
            pass:''
        }
        this.on('route', () => {
            console.log('route login')
        })
        store.change('changed', (state, store) => {
            if(state.auth.isSignin){
                riotRoute('/todo')
            }
            self.update()
        })
        handleInputChange(e) {
            const target = e.target
            const value = target.type === 'checkbox'? target.checked: target.value
            const name = target.name
            self.user[name] = value
        }
        login(e) {
            e.preventDefault()
            store.action(LoginTypes.SIGNIN, self.user)
        }
    </script>
    <style>
        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }

        .form-signin .checkbox {
            font-weight: 400;
        }

        .form-signin .form-control {
            position: relative;
            box-sizing: border-box;
            height: auto;
            padding: 10px;
            font-size: 16px;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
</login>