import riotx from 'riotx'
import TodoTypes from './TodoTypes'

const todoStore = new riotx.Store({
  name: 'todo-store',
  state: {
    todoList: [],
    todo: {
      id: -1,
      value: '',
      description: '',
      deadline: '',
      status: 'unfinished',
      availability: false
    }
  },
  mutations: {
    [TodoTypes.ADD_TODO](context, todo) {
      console.log(context)
      context.state.todoList.push(todo)
      return ['changed']
    },
    [TodoTypes.EDIT_TODO](context, todo) {
      context.state.todoList[todo.id] = todo
      context.state.todoList = Object.assign([], context.state.todoList)
      return ['changed']
    },
    [TodoTypes.DELETE_TODO](context, todo) {
      const deleteTodo = todo
      const _todoList = context.state.todoList

      const getIndex = (value, arr, prop) => {
        for (var i = 0; i < arr.length; i++) {
          if (arr[i][prop] === value) {
            return i
          }
        }
        return -1
      }
      const deleteIndex = getIndex(deleteTodo.id, context.state.todoList, 'id')
      _todoList.splice(deleteIndex, 1)
      return ['changed']
    }
  },
  actions: {
    [TodoTypes.ADD_TODO]: (context, todo) => {
        todo.id =
        context.getter('todoList').length > 0
          ? context.getter('todoList')[context.getter('todoList').length - 1].id + 1
          : 0
      context.commit(TodoTypes.ADD_TODO, Object.assign({}, todo))
    },
    [TodoTypes.EDIT_TODO]: (context, todo) => {
      context.commit(TodoTypes.EDIT_TODO, Object.assign({}, todo))
    },
    [TodoTypes.DELETE_TODO]: (context, todo) => {
      context.commit(TodoTypes.DELETE_TODO, Object.assign({}, todo))
    }
  },
  getters: {
    inputTodo: (context, data) => context.state.todo,
    todoList: (context, data) => context.state.todoList
  }
})

todoStore.change('changed', (state, store) => {
  console.log(`state:${JSON.stringify(state)}, store:${JSON.stringify(store)}`)
})
export default todoStore
