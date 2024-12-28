import { Controller } from "@hotwired/stimulus";
import {
  Chart,
  BarController,
  BarElement,
  CategoryScale,
  LinearScale,
  Title,
  Tooltip,
  Legend,
} from "https://ga.jspm.io/npm:chart.js@4.3.0/dist/chart.js";

Chart.register(BarController, BarElement, CategoryScale, LinearScale, Title, Tooltip, Legend);

export default class extends Controller {
  static targets = ["canvas"];

  connect() {
    const ctx = this.canvasTarget.getContext("2d");
    const data = JSON.parse(this.canvasTarget.dataset.chartData);

    new Chart(ctx, {
      type: "bar",
      data: {
        labels: data.labels,
        datasets: [
          {
            label: data.label,
            data: data.values,
            backgroundColor: "rgba(75, 192, 192, 0.2)",
            borderColor: "rgba(75, 192, 192, 1)",
            borderWidth: 1,
          },
        ],
      },
      options: {
        responsive: true,
        scales: {
          x: {
            type: "category",
          },
          y: {
            type: "linear",
            beginAtZero: true,
          },
        },
      },
    });
  }
}
