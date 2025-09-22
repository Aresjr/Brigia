import { Component, ViewChild } from '@angular/core';
import {
  ApexNonAxisChartSeries,
  ApexChart,
  ApexResponsive,
  ChartComponent
} from 'ng-apexcharts';

export type ChartOptions = {
  series: ApexNonAxisChartSeries;
  chart: ApexChart;
  labels: string[];
  responsive: ApexResponsive[];
};

@Component({
  selector: 'app-donut',
  imports: [
    ChartComponent
  ],
  templateUrl: './donut.component.html'
})
export class ReceivableDonutComponent {
  @ViewChild('chart') chart!: ChartComponent;

  public chartOptions: Partial<ChartOptions>;

  constructor() {
    this.chartOptions = {
      series: [30, 50, 20], // exemplo: Vencido, A vencer, Pago
      chart: {
        type: 'donut',
        width: 380
      },
      labels: ['Vencido', 'A vencer', 'Pago'],
      responsive: [
        {
          breakpoint: 480,
          options: {
            chart: { width: 300 },
            legend: { position: 'bottom' }
          }
        }
      ]
    };
  }
}
