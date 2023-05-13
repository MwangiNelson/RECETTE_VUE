import { createApp } from 'vue'

import { createRouter, createWebHistory } from 'vue-router'
import './style.css'
import { store } from './store'
import App from './App.vue'


const routes = [
    { path: '/', component: () => import('./screens/Home.vue') },
    { path: '/recipes', component: () => import('./screens/Recipes.vue') },
    { path: '/recipes/:name', component: () => import('./sections/recipes/FullRecipe.vue') },
    { path: '/cookbook', component: () => import('./screens/CookBook.vue') },
    { path: '/recette-creator', component: () => import('./screens/Editor.vue') },
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
// const savedState = JSON.parse(localStorage.getItem('store'))
// if (savedState) {
//     store.replaceState(savedState)
// }

createApp(App).use(router).use(store).mount('#app')

