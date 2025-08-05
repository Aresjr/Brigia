export interface Disponibilidade {
    id?: number;
    profissionalId: number;
    data: string;
    horaInicio: string;
    horaFim: string;
    intervaloMinutos: number;
    status: 'DISPONIVEL' | 'INDISPONIVEL';
}

