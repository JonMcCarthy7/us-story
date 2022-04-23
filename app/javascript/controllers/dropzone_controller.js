import Dropzone from "dropzone";
import {Controller} from "stimulus"
import DirectUploadController from '../direct_upload_controller'
import {getMetaValue, removeElement} from "../helpers"

export default class extends Controller {
  static targets = ["input", "element", "signedId"]

  connect() {
    this.dropZone = this.createDropZone(this)
    this.hideFileInput()
    this.bindEvents()
  }

  createDropZone(controller) {
    return new Dropzone(this.elementTarget, {
      url: controller.url,
      headers: controller.headers,
      maxFiles: controller.maxFiles,
      maxFilesize: controller.maxFileSize,
      acceptedFiles: controller.acceptedFiles,
      addRemoveLinks: controller.addRemoveLinks,
      autoQueue: false,
      init: function init() {
        controller.addExistingFiles(this)
      }
    })
  }

  addExistingFiles(dz_init_this) {
    const existingFiles = this.existingFiles
    if (existingFiles?.length) {
      existingFiles.forEach(file => {
        let mockFile = {attachment_id: file.id, name: file.blob.filename, size: file.blob.byte_size, accepted: true}
        dz_init_this.displayExistingFile(mockFile, file.blob.url)
        dz_init_this.files.push(mockFile)
      })
    }
  }

  hideFileInput() {
    this.inputTarget.disabled = true
    this.inputTarget.style.display = "none"
  }

  bindEvents() {
    this.dropZone.on("addedfile", file => {
      // $('input[type="submit"]').attr('disabled', true)
      setTimeout(() => {
        file.accepted && this.createDirectUploadController(this, file).start()
      }, 500)
    })

    this.dropZone.on("removedfile", file => {
      if (file.accepted) {
        if (file.controller) {
          const hiddenInput = file.controller.hiddenInput
          removeElement(hiddenInput)
          this.deleteFile({signed_id: hiddenInput.value})
        } else {
          this.deleteFile({attachment_id: file.attachment_id})
        }
      }
    })

    this.dropZone.on("canceled", file => {
      file.controller && file.controller.xhr.abort()
    })

    this.dropZone.on("queuecomplete", file => {
      // setTimeout(() => $('input[type="submit"]').attr('disabled', false), 500)
    })
  }

  createDirectUploadController(source, file) {
    return new DirectUploadController(source, file);
  }

  get headers() {
    return {"X-CSRF-Token": getMetaValue("csrf-token")}
  }

  get url() {
    return this.inputTarget.getAttribute("data-direct-upload-url")
  }

  get maxFiles() {
    return this.data.get("maxFiles") || 1
  }

  get maxFileSize() {
    return this.data.get("maxFileSize") || 256
  }

  get acceptedFiles() {
    return this.data.get("acceptedFiles")
  }

  get addRemoveLinks() {
    return this.data.get("addRemoveLinks") || true
  }

  get deleteUrl() {
    return this.data.get("deleteUrl")
  }

  get existingFiles() {
    return JSON.parse(this.data.get("existingFiles"))
  }

  deleteFile(payload) {
    Rails.ajax({
      type: 'DELETE',
      dataType: 'JSON',
      url: this.deleteUrl,
      data: {...payload},
      beforeSend: xhr => xhr.setRequestHeader('X-CSRF-Token', getMetaValue("csrf-token"))
    })
  }
}

