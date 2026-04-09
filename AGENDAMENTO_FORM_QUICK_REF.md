# AgendamentoFormComponent - Quick Reference

## Form Controls at a Glance

```typescript
pacienteId          // Patient selection (required)
data                // Appointment date (required, ISO format)
hora                // Appointment time (required, HH:mm)
duracao             // Duration in minutes (required, 2-3 chars)
tipoAgendamento     // Type enum (required)
profissionalId      // Professional selection (required)
especialidadeId     // Specialty selection (required)
procedimentoId      // Main procedure (required)
convenioId          // Health insurance (optional)
empresaId           // Business plan (optional)
formaPagamento      // Payment method (optional)
valor               // Main procedure price (disabled by default)
desconto            // Discount (disabled by default - admin only)
observacoes         // Notes
precoAlterado       // Flag: true if price was manually changed
encaixe             // Flag: fit-in appointment
pago                // Flag: fully paid
quantiaPaga         // Amount paid
filaEspera          // Flag: save to waiting list instead
status              // Appointment status enum
procedimentos[]     // FormArray of additional procedures
```

## Inputs (What Parent Passes)

| Input | Type | When Used |
|-------|------|-----------|
| `agendamentoDetalhes` | Agendamento \| null | Loading existing agendamento for view/edit |
| `dataAgendamento` | Date \| null | Pre-selecting a date |
| `duracaoDisponibilidade` | number \| null | Pre-filling duration from available slot |
| `pacienteId` | number \| null | Pre-selecting patient |
| `profissionalId` | number \| null | Pre-selecting professional |
| `filaEspera` | FilaEspera \| null | Loading from waiting list |

## Critical Methods

### Initialization
- **`ngOnInit()`** - Loads all data, detects mode, loads rascunho if available

### Selection Methods (Called by template)
- **`selectPaciente(paciente)`** - Auto-fills convenio & empresa from patient defaults
- **`selectProfissional(id)`** - Filters specialties, loads available times
- **`selectEspecialidade(esp)`** - Filters professionals by specialty
- **`selectConvenio(conv)`** - Recalculates all procedure prices
- **`selectEmpresa(emp)`** - Recalculates all procedure prices
- **`selectProcedimento(proc)`** - Calculates procedure price & duration

### Availability & Hours
- **`carregarHorariosDisponiveis()`** - Fetches available time slots
- **`onSelectHora()`** - Auto-fills duration from selected time range

### Pricing
- **`calcularValorProcedimento(index)`** - Looks up price with priority:
  1. Health Insurance (if selected)
  2. Business Plan (if selected)
  3. Standard (default)
  - Updates both main and additional procedures

- **`calcularValorTotal()`** - Main + additions - discount
- **`calcularQuantiaFaltante()`** - Shows remaining balance
- **`calcularDuracaoTotal()`** - Sums all procedure durations

### Special Permission Access (Value/Discount)
- **`solicitarHabilitacaoValor()`** - Opens admin credentials dialog for price
- **`solicitarHabilitacaoDesconto()`** - Opens admin credentials dialog for discount
- **`validarCredenciaisAdmin(creds)`** - Validates against AuthService
- If valid: grants `permissaoAdminValorConcedida` or `permissaoAdminDescontoConcedida`

### Additional Procedures Management
- **`adicionarProcedimento()`** - Creates new FormGroup for additional procedure
- **`removerProcedimento(index)`** - Removes procedure and recalculates
- **Each procedure has:** quantidade, procedimentoId, valor, desconto

### Saving
- **`onSubmit()`** - Main save method
  - Validates: form valid AND desconto ≤ valor
  - Emits `save` event with form data
  - Clears rascunho
  Note: Can also save to waiting list if `filaEspera` flag set

- **`salvarRascunho()`** - Saves incomplete form as draft via service

### Status Change Actions (Edit Mode)
- **`marcarNaoCompareceu()`** - No-show status
- **`marcarCanceladoPeloUsuario()`** - User cancellation status
- **`excluirAgendamento()`** - Delete agendamento

### Attendance Opening
- **`abrirAtendimento(agendamento)`** - Start medical attendance (doctor-only)

## Payment Type Toggle

```typescript
selecionarTipoPagamento(tipo: 'pago' | 'parcial')
// 'pago' = fully paid (auto-fills quantiaPaga)
// 'parcial' = partial payment (quantiaPaga = 0)
```

## Modes

| Mode | Trigger | Form State | Save Available |
|------|---------|-----------|-----------------|
| **New** | No agendamentoDetalhes | Enabled | Yes |
| **View** | agendamentoDetalhes set | Disabled | No |
| **Edit** | User clicks Edit button | Enabled (except pacienteId) | Yes |
| **Draft** | Rascunho loaded | Enabled | Yes (option to save draft again) |

## Data Loading Pattern (All Parallel via forkJoin)

```
ngOnInit():
  ├─ carregarPacientes()
  ├─ carregarConvenios()
  ├─ carregarEspecialidades()
  ├─ carregarProfissionais()
  ├─ carregarEmpresas()
  └─ carregarProcedimentos()
       ↓
  All loaded → Detect mode → Load agendamento OR draft OR wire up listeners
```

## Search Features

- **Patient Search:** Cached with up to 50 recent searches
- **Initial Load:** Shows first 50 patients (max 100 results)
- **Search Fields:** Name and CPF

## Service Dependencies

**Data Loading:** PacienteService, ConvenioService, EspecialidadeService, ProfissionalService, EmpresaService, ProcedimentoService

**Operations:** AgendamentoService (times, status updates), FilaEsperaService (waiting list), AtendimentoService (start attendance), AuthService (admin validation)

**Helper:** AgendamentoRascunhoService (draft management), UserService (permissions), Router (navigation), ToastrService (notifications)

## Key Behaviors

### When Professional Changes
1. Filter specialties to professional's specialties
2. Auto-select if only one specialty
3. Load available times for date/professional combo
4. Duration field auto-cleared for recalculation

### When Convenience/Plan Changes
1. Recalculate ALL procedure prices (main + additional)
2. Respect hierarchy: Convenio > Empresa > Particular

### When Procedure Selected
1. Look up price with plan hierarchy
2. Update valor field
3. Recalculate total
4. Auto-calculate duration (if not manually set)

### When Value/Discount Changed
1. Recalculate total value
2. Recalculate remaining balance
3. For 'pago' payment type: auto-update quantiaPaga

### On Form Close Without Saving
1. If dirty: ask for confirmation
2. If rascunho loaded already: don't ask (prevents accidental loss)
3. Can save as draft instead of closing

## Disabled Fields By Default

- **valor** - needs admin approval to edit, or auto-calculated from price lookup
- **desconto** - needs admin approval to edit

Both can be enabled by:
1. Clicking edit button (if already approved)
2. Providing admin credentials (first time)
3. Once approved, stays approved for current editing session

## Import Dependencies

```typescript
// Angular Core
Component, Input, OnInit, FormBuilder, FormArray, ReactiveFormsModule, Validators

// Material & UI
NgSelectComponent, NgOptionComponent, NgNotFoundTemplateDirective
CurrencyPipe, NgClass, NgFor, NgIf

// Custom Services & Interfaces
PacienteService, PacienteFormComponent
ConvenioService, Convenio
EspecialidadeService, Especialidade
ProfissionalService, Profissional
EmpresaService, Empresa
ProcedimentoService, Procedimento
AgendamentoService, Agendamento, AgendamentoRequest, TIPO_AGENDAMENTO, StatusAgendamento
FormComponent, IForm
ToastrService
UserService, AuthService
Router, AtendimentoService
AgendamentoRascunhoService
FilaEsperaService, FilaEspera, FilaEsperaRequest

// Utilities
forkJoin, map, Observable, tap (RxJS)
ColorUtils, autoResize, limitLength, FORMAS_PAGAMENTO
ConfirmDialogComponent, AdminCredentialsDialogComponent
```

## Common Event Flows

### New Appointment (No Pre-selections)
```
1. Component loads → ngOnInit
2. Load all data in parallel
3. Show empty form with first 50 patients
4. User selects patient → selectPaciente()
5. User selects professional → selectProfissional() → load times
6. User selects date/time → onSelectHora()
7. System auto-fills duration from available slot
8. User can add procedures → adicionarProcedimento()
9. Submit → onSubmit() → emit save
```

### From Availability/Calendar
```
1. Parent passes dataAgendamento + profissionalId
2. ngOnInit pre-fills these fields
3. carregarHorariosDisponiveis() auto-called
4. Form ready for other selections
5. Rest similar to above
```

### From Waiting List (FilaEspera)
```
1. Parent passes filaEspera object
2. ngOnInit → carregarDadosFilaEspera()
3. Form pre-filled with all waiting list data
4. User can modify if needed
5. Save creates new agendamento (not updating waiting list)
```

### Edit Existing Agendamento
```
1. Parent passes agendamentoDetalhes
2. ngOnInit → carregaDadosAgendamento() → disable form
3. User clicks Edit → onEdit() → enable form except pacienteId
4. User modifies fields
5. Submit → emit save with new values
```

---

## For Creating Orcamento Form

**Copy This Pattern:**
1. FormComponent base class (same)
2. Same input/output structure (@Input for data, emit save/cancel)
3. FormArray for line items (same pattern)
4. Same service injection pattern
5. Same forkJoin for parallel data loading
6. Same selection/filtering methods
7. Same pricing calculation (may differ in logic)
8. Same rascunho/draft pattern
9. Same admin controls for sensitive fields
10. Same status/action confirmations

**Key Differences:**
- Different entities (OrcamentoRequest instead of AgendamentoRequest)
- May not need professional/resource scheduling
- Different status enum (draft, sent, accepted, rejected, etc.)
- May not need available-time selection (different concept)
- May have different pricing rules (e.g., percentage-based, tiered, etc.)
- Item structure in FormArray (procedures vs service/product items)
