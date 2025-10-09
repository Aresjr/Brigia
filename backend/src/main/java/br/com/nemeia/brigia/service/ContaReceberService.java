package br.com.nemeia.brigia.service;

import br.com.nemeia.brigia.exception.ValorRecebidoUltrapassadoException;
import br.com.nemeia.brigia.model.StatusContaReceber;
import br.com.nemeia.brigia.utils.BigDecimals;
import br.com.nemeia.brigia.utils.DbUtil;
import br.com.nemeia.brigia.auth.SecurityHolder;
import br.com.nemeia.brigia.exception.NotFoundException;
import br.com.nemeia.brigia.mapper.ContaReceberMapper;
import br.com.nemeia.brigia.model.Agendamento;
import br.com.nemeia.brigia.model.ContaReceber;
import br.com.nemeia.brigia.repository.ContaReceberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

@Service
@RequiredArgsConstructor
@Slf4j
public class ContaReceberService {

    private final ContaReceberRepository repository;
    private final ContaReceberMapper mapper;

    @Transactional(readOnly = true)
    public Page<ContaReceber> getPaged(int page, int size) {
        log.info("Buscando contas a receber paginadas - page: {}, size: {}", page, size);
        Pageable pageable = PageRequest.of(page, size, DbUtil.DEFAULT_SORT);
        return repository.findAllByUnidadeIdIs(pageable, SecurityHolder.getLoggedUserUnidadeId());
    }

    @Transactional(readOnly = true)
    public ContaReceber getById(Long id) {
        log.info("Buscando conta a receber por ID: {}", id);
        return repository.findById(id).orElseThrow(() -> new NotFoundException("Conta a receber não encontrada"));
    }

    @Transactional
    public void createContaReceberFromAgendamento(Agendamento agendamento) {
        ContaReceber contaReceber = mapper.fromAgendamento(agendamento);
        repository.save(contaReceber);
    }

    @Transactional
    public ContaReceber registrarRecebimento(Long id, BigDecimal valorRecebido) {
        ContaReceber contaReceber = getById(id);
        if (BigDecimals.gt(valorRecebido, contaReceber.getValorTotal())) {
            throw new ValorRecebidoUltrapassadoException();
        }
        contaReceber.setValorRecebido(contaReceber.getValorRecebido().add(valorRecebido));
        boolean pagoTotalmente = contaReceber.getValorRecebido().equals(contaReceber.getValorTotal());
        contaReceber.setStatus(pagoTotalmente ? StatusContaReceber.PAGO : StatusContaReceber.PARCIAL);
        repository.save(contaReceber);
        return contaReceber;
    }
}
