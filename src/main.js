import { createApp } from 'vue'
import notification from './notification'
import { createRouter, createWebHistory } from 'vue-router'
import './style.css'
import { store } from './store'
import App from './App.vue'


const routes = [
    { path: '/', component: () => import('./screens/Home.vue') },
    {
        path: '/recipes',
        component: () => import('./screens/Recipes.vue'),

    },
    {
        path: '/recipes/:name', component: () => import('./sections/recipes/FullRecipe.vue'), beforeEnter: (to, from, next) => {
            if (store.state.isAuthenticated) {
                next()
            } else {
                notification("Please sign in first", "#ffc107")
                next(false)
            }
        }
    },
    {
        path: '/cookbook',
        component: () => import('./screens/CookBook.vue'),
        beforeEnter: (to, from, next) => {
            if (store.state.isAuthenticated) {
                next()
            } else {
                notification("Please sign in first", "#ffc107")
                next(false)
                setTimeout(() => {
                    notification("Feature is limited to subscribed users", "#1e90ff")
                }, 1500)
            }
        }
    },
    {
        path: '/recette-creator', component: () => import('./screens/Editor.vue'),
        beforeEnter: (to, from, next) => {
            if (store.state.isAuthenticated) {
                next()
            } else {
                notification("Please sign in first", "#ffc107")
                next(false)
                setTimeout(() => {
                    notification("Feature is limited to subscribed users", "#1e90ff")
                }, 1500)
            }
        }
    },
]

const router = createRouter(
    {
        history: createWebHistory(),
        routes,
    }
)

// Save state to localStorage on beforeunload event
window.addEventListener('beforeunload', () => {
    localStorage.setItem('store', JSON.stringify(store.state))
})
// Retrieve state from localStorage and initialize store
const savedState = JSON.parse(localStorage.getItem('store'))
if (savedState) {
    store.replaceState(savedState)
}

createApp(App).use(router).use(store).mount('#app')

