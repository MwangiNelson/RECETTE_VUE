// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyDU-L-SqfSOhdqJxdKVyrT1a5y4H0mqKmM",
    authDomain: "recette-cd6aa.firebaseapp.com",
    projectId: "recette-cd6aa",
    storageBucket: "recette-cd6aa.appspot.com",
    messagingSenderId: "340336757116",
    appId: "1:340336757116:web:6b9c1c027800549fba7cf9"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

import { getStorage } from 'firebase/storage'
const storage = getStorage(app)

export { storage }