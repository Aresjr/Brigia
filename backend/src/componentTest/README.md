# Testes de Componente

Este diretório contém testes de integração/componente que testam múltiplos componentes da aplicação trabalhando juntos, geralmente com dependências externas reais como banco de dados.

## Estrutura

Os testes de componente são separados dos testes unitários e utilizam:
- **Testcontainers** - Para subir containers Docker com dependências (PostgreSQL, etc.)
- **Spring Boot Test** - Para carregar o contexto completo da aplicação
- **Maven Failsafe Plugin** - Para execução separada dos testes

## Convenções de Nomenclatura

Todos os testes de componente devem seguir o padrão:
- `*IntegrationTest.java` - Sufixo obrigatório para ser detectado pelo Failsafe

## Como Executar

### Executar apenas testes de componente

```bash
./mvnw failsafe:integration-test failsafe:verify
```

ou

```bash
./mvnw verify -DskipTests
```

### Executar apenas testes unitários

```bash
./mvnw test
```

### Executar todos os testes (unitários + componente)

```bash
./mvnw verify
```

## Pré-requisitos

- **Docker** deve estar rodando para que o Testcontainers possa subir os containers
- Conexão com a internet para baixar as imagens Docker na primeira execução

## Testes Disponíveis

### ContaReceberServiceIntegrationTest (6 testes)
Testa o serviço de Contas a Receber com banco de dados real (PostgreSQL via Testcontainers):
- Salvamento de contas a receber
- Listagem paginada
- Criação a partir de agendamento
- Registro de recebimentos parciais e totais
- Validação de que não há erro de stream ao paginar

### AgendamentoServiceIntegrationTest (6 testes)
Testa o serviço de Agendamentos com validação de disponibilidade:
- Criação de agendamento com validação de disponibilidade
- Criação de agendamento com encaixe (sem validação)
- Criação de agendamento com lista de procedimentos
- Listagem paginada por data
- Edição de agendamento existente
- Busca por token público

### PacienteServiceIntegrationTest (8 testes)
Testa operações CRUD de Pacientes:
- Criação de paciente
- Criação com convênio e empresa
- Busca por ID
- Validação de exceção quando não encontrado
- Listagem paginada
- Edição de paciente
- Contagem por status (excluído/ativo)
- Listagem de aniversariantes do dia

### AtendimentoServiceIntegrationTest (6 testes)
Testa o workflow completo de atendimentos:
- Iniciar atendimento a partir de agendamento
- Finalizar atendimento com dados clínicos
- Criar atendimento em operação única
- Listagem paginada
- Busca por ID
- Validação de manutenção de valores do agendamento

### ProfissionalServiceIntegrationTest (8 testes)
Testa operações CRUD de Profissionais:
- Criação de profissional
- Criação com especialidades associadas
- Busca por ID
- Busca por usuário ID
- Validação de exceção quando não encontrado
- Listagem paginada
- Edição mantendo usuário e unidade
- Listagem de aniversariantes do dia

### EmpresaConvenioServiceIntegrationTest (7 testes)
Testa operações de Empresas e Convênios:
- Criação de empresa
- Criação de empresa com plano empresarial
- Listagem paginada de empresas
- Criação de convênio
- Edição de convênio
- Listagem paginada de convênios
- Exclusão lógica e restauração de empresa

## GitHub Actions

O workflow `.github/workflows/springboot.yml` está configurado para executar:
1. Compilação (`mvn compile`)
2. Testes unitários (`mvn test`)
3. Testes de componente (`mvn verify`)

Ambos os tipos de teste são executados no CI/CD.

## Troubleshooting

### Testcontainers não inicia containers
- Verifique se o Docker está rodando
- Verifique se você tem permissões para acessar o Docker daemon

### Testes lentos
- Os testes de componente são naturalmente mais lentos que unitários pois sobem containers
- Na primeira execução, as imagens Docker serão baixadas (pode demorar)
- Execuções subsequentes são mais rápidas pois as imagens ficam em cache

### Porta já em uso
- Se receber erro de porta em uso, outro container pode estar rodando
- Execute `docker ps` para ver containers ativos
- Execute `docker stop <container-id>` para parar containers desnecessários
