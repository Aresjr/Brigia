package br.com.nemeia.brigia.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "contas_receber")
public class ContasReceber extends BaseModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

/*
Paciente / Cliente

Nome

Contato (telefone/whatsapp, e-mail)

Atendimento

Data do atendimento

Profissional responsável (médico/dentista/etc.)

Procedimentos listados (ou link "ver mais")

Financeiro

Valor total

Valor recebido (se for parcial)

Valor em aberto

Forma de pagamento (dinheiro, cartão, convênio, Pix)

Status: Aberto, Pago, Atrasado, Parcial (com cores/status badge)

Controle

Data de vencimento da fatura

Dias em atraso (se já venceu)

Botões rápidos: Marcar como pago, Editar, Gerar boleto/Pix, Enviar lembrete
 */

}
