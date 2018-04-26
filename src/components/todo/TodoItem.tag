<todo-item>
  <div class="form-check">
    <div class="card {expiration()}">
      <div class="card-header" id="todoh{todo.id}">
        <h5 class="mb-0">
          <button class="btn btn-link"
                  data-toggle="collapse"
                  data-target="#todo{todo.id}"
                  aria-expanded="true"
                  aria-controls="todo{todo.id}">
            <span style={textDecoration()}>{todo.value}</span>
            <span if={isFinished()} class="badge badge-danger">Finished</span>
            <span if={new Date() > new Date(todo.deadline) && !isFinished()} class="badge badge-danger">Expiration</span>
          </button>
        </h5>
      </div>
      <div id="todo{todo.id}"
           class="collapse show"
           aria-labelledby="todoh{todo.id}"
           data-parent="#accordion">
        <div class="card-body">
          <div>
            <strong>Description:</strong><br/>
            <Nl2br text={todo.description}></Nl2br>
          </div>
          <div>
            <strong>Deadline:</strong> {todo.deadline}
          </div>
          <div class="btn-toolbar">
            <div class="btn-group">
              <button type="button"
                      class="btn btn-success"
                      onclick={changeStatus}>{todo.status}</button>
              <button type="button"
                      class="btn btn-danger"
                      onclick={deleteTodo}>Delete</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    import TodoTypes from '../../store/TodoTypes'
    import '../common/Nl2br.tag'

    const store = this.riotx.get('todo-store')
    const self = this
    self.todo = opts.todo

    expiration() {
        const bool = new Date() > new Date(self.todo.deadline) && self.todo.status === 'unfinished'
        return bool ? "text-white bg-warning": ""
    }
    isFinished(){
        return self.todo.status === 'finished'
    }
    textDecoration(){
        return "text-decoration : " + (self.isFinished() ? "line-through;": "none;")
    }
    changeStatus(e){
      const nextTodo = Object.assign({}, self.todo)
      nextTodo.status = nextTodo.status === 'finished' ? 'unfinished' : 'finished'
      store.action(TodoTypes.EDIT_TODO, nextTodo)
    }
    deleteTodo(e){
      if (window.confirm('Do you want to delete this Todo?')) {
        store.action(TodoTypes.DELETE_TODO, self.todo)
      }
    }
  </script>
</todo-item>