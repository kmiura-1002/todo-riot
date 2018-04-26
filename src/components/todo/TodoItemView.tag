<todo-item-view>
    <div>
        <todo-item each={todo in todoList} todo={todo}/>
    </div>
    <script>
        import './TodoItem.tag'

        const store = this.riotx.get('todo-store')
        const self = this
        self.todoList = store.getter('todoList')

        store.change('changed', (state, store) => {
            self.todoList = state.todoList
            self.update()
        })
    </script>
</todo-item-view>