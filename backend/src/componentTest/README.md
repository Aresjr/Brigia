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

### ContaReceberServiceIntegrationTest
Testa o serviço de Contas a Receber com banco de dados real (PostgreSQL via Testcontainers):
- Salvamento de contas a receber
- Listagem paginada
- Criação a partir de agendamento
- Registro de recebimentos parciais e totais
- Validação de que não há erro de stream ao paginar

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
