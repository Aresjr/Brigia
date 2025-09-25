import { Component, Input } from '@angular/core';
import {
  ApexNonAxisChartSeries,
  ApexChart,
  ApexResponsive,
  ChartComponent
} from 'ng-apexcharts';
import { ContaReceber } from './contas-receber.interface';

export type ChartOptions = {
  series: ApexNonAxisChartSeries;
  chart: ApexChart;
  states: {}
  labels: string[];
  colors: string[];
  legend: ApexLegend;
  fill: ApexFill;
  plotOptions: {
    pie?: {
      donut?: {
        size?: string;
        labels?: {
          show?: boolean;
          value?: {};
          total?: {
            show?: boolean;
            label?: string;
            formatter?: () => string;
          };
        };
      };
    };
  };
  responsive: ApexResponsive[];
  tooltip: ApexTooltip
};

@Component({
  selector: 'app-conta-receber-donut',
  imports: [
    ChartComponent
  ],
  templateUrl: './conta-receber-donut.component.html'
})
export class ContaReceberDonutComponent {
  @Input() contaReceber!: ContaReceber;
  protected chartOptions: Partial<ChartOptions> = {};

  ngOnChanges(): void {
    console.log('this.contaReceber', this.contaReceber);
    if (!this.contaReceber) {
      return;
    }

    const valorTotal = this.contaReceber?.valorTotal || 0;
    const valorDesconto = this.contaReceber.valorDesconto || 0;
    const valorRecebido = this.contaReceber.valorRecebido || 0;
    const valorNaoRecebido = valorTotal - valorRecebido;

    this.chartOptions = {
      series: [valorRecebido, valorNaoRecebido, valorDesconto],
      chart: {
        type: "donut",
        height: 162
      },
      states: {
        hover: {
          filter: {
            type: "none"
          }
        }
      },
      labels: ["Recebido", "A Receber", "Desconto"],
      colors: ["#22c55e", "#FFCA28", '#60a5fa'],
      legend: { show: false },
      fill: { type: "solid" },
      plotOptions: {
        pie: {
          donut: {
            size: "65%",
            labels: {
              show: true,
              value: {
                formatter: (val: string) => `R$ ${parseFloat(val).toLocaleString("pt-BR")}`
              },
              total: {
                show: true,
                label: "Total",
                formatter: () => `R$ ${valorTotal}`
              }
            }
          }
        }
      },
      responsive: [
        {
          breakpoint: 480,
          options: {
            chart: { width: 200 },
            legend: { position: "bottom" }
          }
        }
      ],
      tooltip: {
        y: {
          formatter: (val: number) => `R$ ${val.toLocaleString("pt-BR")}`
        }
      },
    };
  }

}
