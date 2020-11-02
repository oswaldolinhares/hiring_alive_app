import {
  Controller
} from "stimulus"
import Rails from "@rails/ujs"
export default class extends Controller {
  static targets = ["manufacturer", "model", "carrierPlanType"]

  get manufacturer() {
    return this.manufacturerTarget.value
  }

  get model() {
    return this.modelTarget
  }

  get carrierPlanType() {
    return this.carrierPlanTypeTarget
  }

  handleManufacturerSelectChange() {
    this.getModelsData()
  }

  getModelsData() {
    let manufacturer = this.manufacturer

    Rails.ajax({
      type: "GET",
      url: "/models.json",
      data: `manufacturer=${manufacturer}`,
      success: (data) => {
        this.updateSelectModelOptions(data);
      }
    })
  }

  updateSelectModelOptions(data) {
    this.model.innerHTML = ""
    this.createPromptToSelectModel()

    data.forEach((modelName) => {
      const option = document.createElement("option")

      option.value = modelName
      option.innerHTML = modelName
      this.model.appendChild(option)
    })
  }

  createPromptToSelectModel() {
    const option = document.createElement("option")

    option.value = ""
    option.innerHTML = "Modelo..."
    this.model.appendChild(option)
  }
}