<NavTemplate>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a href="/todo" class="navbar-brand">Todo</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link btn btn-link" onClick={logout}>Signout<span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
    </nav>
    <script>
        import LoginTypes from '../../store/LoginTypes'
        import riotRoute from 'riot-route'

        const store = this.riotx.get('auth-store')

        logout(e) {
            store.action(LoginTypes.SIGNOUT)
        }

        store.change('changed', (state, store) => {
            if(!state.auth.isSignin){
                riotRoute('/login')
            }
        })
    </script>
</NavTemplate>