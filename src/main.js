import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import './style.css'
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

createApp(App).use(router).mount('#app')
