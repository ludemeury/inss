import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input"]

  async calculate() {
    const income = this.inputTarget.value;

    if (income === "") {
      this.updateDiscount("0.00");
      return;
    }

    try {
      const response = await fetch("/proponents/inss_discount", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute("content")
        },
        body: JSON.stringify({ income })
      });

      if (!response.ok) {
        throw new Error("Falha ao calcular desconto do INSS");
      }

      const data = await response.json();
      this.updateDiscount(data.discount);
    } catch (error) {
      console.error("Falha ao calcular desconto do INSS:", error);
      this.updateDiscount("Error");
    }
  }

  updateDiscount(discount) {
    const discountOutput = document.getElementById("discount-output");
    const discountValue = document.getElementById("calculated-inss-discount");
  
    if (parseFloat(discount) > 0) {
      discountValue.textContent = discount;
      discountOutput.classList.remove("d-none");
    } else {
      discountOutput.classList.add("d-none");
    }
  }
}
