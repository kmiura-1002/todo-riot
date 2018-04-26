<todo-page>
    <div>
        <NavTemplate></NavTemplate>
        <div class='container'>

            <div class="jumbotron">
                <div class="container">
                    <h1 class="display-3">Todo List</h1>
                </div>
            </div>
            <div class="container">
                <div class="card">
                    <div class="card-header">
                        Todo View
                    </div>
                    <div class="card-body">
                        <todo-item-view/>
                        <hr/>
                        <form onSubmit={submitTodo}>
                            <div class="form-row align-items-center row">
                                <div class="col-auto col-12">
                                    <label class="sr-only" for="inlineFormInput">Add Todo</label>
                                    <div class="input-group mb-3">
                                        <input name="value" type="text" onchange={ handleInputChange } value={todo.value} required class="form-control" id="inlineFormInput" placeholder="Todo" />
                                        <div class="input-group-append">
                                            <a class="input-group-prepend btn btn-primary" data-toggle="collapse" href="#detail" role="button" aria-expanded="false" aria-controls="detail">Detail</a>
                                        </div>
                                    </div>
                                    <div class="col-auto mb-3 collapse" id="detail">
                                        <div class="card card-body">
                                            <div class="form-group">
                                                <label for="description">
                                                        <strong>Description:</strong>
                                                    </label>
                                                <textarea onchange={handleInputChange} name="description" value={todo.description} d="text" class="form-control" ></textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="date">
                                                        <strong>Deadline:</strong>
                                                    </label>
                                                <input onchange={handleInputChange} name="deadline" value={todo.deadline} type="text" class="form-control" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-auto">
                                    <button type="submit" class="btn btn-primary mb-2">Add Todo</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <hr/>
            </div>
        </div>
        <FooterTemplate></FooterTemplate>
    </div>
    <script>
        import TodoTypes from '../../store/TodoTypes'
        import '../common/PageTemplate.tag'
        import '../common/NavTemplate.tag'
        import '../common/FooterTemplate.tag'
        import './TodoItemView.tag'
        import riotRoute from 'riot-route'

        const store = this.riotx.get('todo-store')
        const authStore = this.riotx.get('auth-store')
        const self = this
        self.todo = {
            id: -1,
            value: '',
            description: '',
            deadline: '',
            status: 'unfinished',
            availability: true
        }
        this.on('route', () => {
            console.log('route todo')
            if(!authStore.getter('auth').isSignin){
                riotRoute('/login')
            }
        })
        handleInputChange(e) {
            const target = e.target
            const value = target.type === 'checkbox'? target.checked: target.value
            const name = target.name
            self.todo[name] = value
        }

        submitTodo(e) {
            e.preventDefault()
            store.action(TodoTypes.ADD_TODO, self.todo)
            self.todo = {
                id: -1,
                value: '',
                description: '',
                deadline: '',
                status: 'unfinished',
                availability: true
            }
        }
        store.change('changed', (state, store) => {
            self.update()
        })
    </script>
</todo-page>