export interface Entidade {
    id: number;
    nome: string;
    criadoEm: string | null;
    excluido: boolean;
    toString(): string;
}
