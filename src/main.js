import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import './style.css'
import App from './App.vue'


const routes = [
    { path: '/', component: () => import('./screens/Home.vue') },
    { path: '/recipes', component: () => import('./screens/Recipes.vue') },
]

const router = createRouter(
    {
        history: createWebHistory(),
        routes,
    }
)

createApp(App).use(router).mount('#app')
