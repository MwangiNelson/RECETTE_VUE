import { createStore } from 'vuex'
import notification from './notification'
import Axios from 'axios'
const state = {
    isAuthenticated: false,
    user: null,
    url_header: 'http://127.0.0.1:8000/'
}

const mutations = {
    login(state, user) {
        state.isAuthenticated = true
        state.user = user
        notification("User log in successful", "#45dd91")
    },
    logout(state) {
        state.isAuthenticated = false
        state.user = null
    }
}

const actions = {
    async login({ commit }, userData) {
        try {
            const response = await Axios.post(`${store.state.url_header}api/user/sign-in`, userData)
            commit('login', response.data.data.user)
            return response.data.data.message
        } catch (error) {
            throw new Error(error.response.data.message)
        }
    },
    async register({ commit }, userData) {
        try {
            const response = await Axios.post(`${store.state.url_header}api/user/sign-up`, userData)
            commit('login', response.data.data.user)
            return response.data.data.message
        } catch (error) {
            throw new Error(error.response.data.message)
        }
    },
    logout({ commit }) {
        commit('logout')
        localStorage.removeItem('store')
        sessionStorage.removeItem('savedRecipes')
        router.push('/')
    }
}

const store = createStore({
    state,
    mutations,
    actions
})

export { store }
