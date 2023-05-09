import { ref, uploadBytes, getDownloadURL } from "firebase/storage"
import { storage } from "./firebase"
import notification from './notification'

const uploadPhotoSyntax = (file, fileName) => {
    return new Promise((resolve, reject) => {
        const storageRef = ref(storage, `recipeImages/${fileName}`)
        uploadBytes(storageRef, file).then(
            (snapshot) => {
                notification("Success uploading photo", "#45dd91")

                getDownloadURL(storageRef).then((img_url) => {
                    resolve(img_url)
                }).catch((err) => {
                    reject(err)
                })
            }
        ).catch((err) => {
            notification(`${err}`, "#fb4d4d")
            reject(err)
        })
    })
}

export default uploadPhotoSyntax
