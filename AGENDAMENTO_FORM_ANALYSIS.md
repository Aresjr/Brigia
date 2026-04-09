# AgendamentoFormComponent - Complete Analysis

## File Location
`frontend/src/app/features/agenda-diaria/agendamento-form.component.ts`

---

## 1. Class Structure

**Base Class:** `FormComponent<Agendamento, AgendamentoRequest>`
- Extends a generic form component with typed request/response
- Overrides key methods like `onSubmit()`, `ngOnInit()`, `onEdit()`

**Component Selector:** `app-agendamento-form`

---

## 2. Input Properties (@Input)

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `agendamentoDetalhes` | `Agendamento \| null` | `null` | Full agendamento data for edit mode |
| `dataAgendamento` | `Date \| null` | `null` | Pre-selected date for new agendamento |
| `duracaoDisponibilidade` | `number \| null` | `null` | Pre-selected duration in minutes |
| `pacienteId` | `number \| null` | (required) | Pre-selected patient ID |
| `profissionalId` | `number \| null` | `null` | Pre-selected professional ID |
| `filaEspera` | `FilaEspera \| null` | `null` | Waiting list data to populate form |

---

## 3. Form Controls Defined (in Constructor)

```typescript
Form Structure:
├── pacienteId: [null] - Patient ID (required, nonNullable)
├── data: [null] - Agendamento date (required, nonNullable)
├── hora: [null] - Time (required, nonNullable)
├── duracao: [null] - Duration in minutes (required, minLength: 2, maxLength: 3)
├── tipoAgendamento: [null] - Type of agendamento (required, nonNullable)
├── profissionalId: [null] - Professional ID (required, nonNullable)
├── especialidadeId: [null] - Specialty ID (required, nonNullable)
├── procedimentoId: [null] - Main procedure ID (required, nonNullable)
├── convenioId: [null] - Health insurance ID (optional)
├── empresaId: [null] - Company/business plan ID (optional)
├── formaPagamento: [null] - Payment method (optional)
├── valor: [null] - Main procedure value (optional, disabled by default)
├── desconto: [null] - Discount amount (optional, disabled by default)
├── observacoes: [null] - Observations (optional)
├── precoAlterado: [false] - Flag if price was altered
├── encaixe: [false] - Whether it's a fit-in agendamento
├── pago: [true] - Fully paid flag
├── quantiaPaga: [null] - Amount paid
├── filaEspera: [false] - Save to waiting list instead of agendamento
├── status: [null] - Agendamento status
└── procedimentos: FormArray - Additional procedures
```

---

## 4. Output Properties (@Output)

None explicitly declared. Uses inherited from `FormComponent`:
- `save: EventEmitter<AgendamentoRequest>` - Emitted on form submit
- `cancel: EventEmitter<void>` - Emitted on form cancel

---

## 5. Key Services (Dependencies via Constructor)

| Service | Used For |
|---------|----------|
| `PacienteService` | Load/filter/create patients |
| `ConvenioService` | Load health insurance plans |
| `EspecialidadeService` | Load medical specialties |
| `ProfissionalService` | Load professionals and filter by specialty |
| `EmpresaService` | Load companies/business plans |
| `ProcedimentoService` | Load procedures, calculate prices by plan |
| `AgendamentoService` | Load agendamentos, get available times, update status |
| `ToastrService` | Show notifications (inherited) |
| `UserService` | Check user permissions |
| `Router` | Navigate to other pages |
| `AtendimentoService` | Start attendance from agendamento |
| `AuthService` | Validate admin credentials for price/discount edit |
| `AgendamentoRascunhoService` | Save/load draft agendamentos |
| `FilaEsperaService` | Save to waiting list |
| `FormBuilder` | Build reactive forms (inherited) |

---

## 6. Constructor Details

```typescript
constructor(
  protected override fb: FormBuilder,              // Form building
  protected override toastr: ToastrService,        // Notifications
  private pacienteService: PacienteService,
  private convenioService: ConvenioService,
  private especialidadeService: EspecialidadeService,
  private profissionalService: ProfissionalService,
  private empresaService: EmpresaService,
  private procedimentoService: ProcedimentoService,
  protected userService: UserService,
  private router: Router,
  private atendimentoService: AtendimentoService,
  private authService: AuthService,
  private rascunhoService: AgendamentoRascunhoService,
  private filaEsperaService: FilaEsperaService,
  private agendamentoService: AgendamentoService
)
```

**Initialization:**
- Sets today's date in ISO format (yyyy-MM-dd)
- Creates reactive form with controls and empty FormArray for procedimentos
- Form is valid but fields are empty by default

---

## 7. ngOnInit() Lifecycle Method

**Main Flow:**
1. Initialize status options from enum
2. Set default date/time/duration from inputs
3. Mark form as pristine
4. Load all data in parallel (forkJoin):
   - Patients, Convenios, Especialidades, Professionals, Companies, Procedures

5. **Based on Mode:**
   - **Edit Mode** (agendamentoDetalhes exists):
     - Load agendamento data into form
     - Disable entire form
   - **Waiting List Mode** (filaEspera exists):
     - Load waiting list data into form
   - **New Agendamento Mode:**
     - Try to load draft (if not pre-selected)
     - If patient/professional pre-selected, select them
     - Disable valor/desconto fields by default

6. Listen to date field changes to reload available times
7. Calculate total value

---

## 8. Key Lifecycle Methods

### `carregaDadosAgendamento()`
**Purpose:** Populate form with complete agendamento details

**Behavior:**
- Patch form values from `agendamentoDetalhes`
- Set payment type based on `pago` flag
- Load all associated procedures into FormArray with validators
- Mark form as pristine

**Called From:** `ngOnInit()` when in edit mode

### `onEdit()`
**Purpose:** Enable form for editing an existing agendamento

**Behavior:**
- Enable entire form
- Keep `pacienteId` disabled (can't change patient)
- Keep `valor`/`desconto` disabled unless admin approval granted
- Set `modoSalvar = true`

**Locks Patient:** Yes (cannot be changed)

---

## 9. Main Data Loading Methods

All return `Observable<T[]>` and use `.tap()` to populate component properties:

1. **`carregarPacientes()`**
   - Creates display label array with name, birthdate, CPF
   - Limits initial display to 50 items
   
2. **`carregarConvenios()`**
   - Stores full list for filtering
   
3. **`carregarEspecialidades()`**
   - Stores and filters based on selected professional
   
4. **`carregarProfissionais()`**
   - Stores and filters based on selected specialty
   
5. **`carregarEmpresas()`**
   - Stores for business plan selection
   
6. **`carregarProcedimentos()`**
   - Stores for use in main and additional procedures

---

## 10. Selection/Filtering Methods

### `selectPaciente(paciente: Paciente | null)`
**Behavior:**
- Sets `pacienteSelecionado`
- Auto-fills `convenioId` and `empresaId` from patient's defaults
- Calls `selectEmpresa()` to trigger price recalculation

### `selectProfissional(id: number | null)`
**Behavior:**
- Filters `especialidadesFiltradas` to only professional's specialties
- Auto-selects specialty if professional has only one
- Clears specialty if multiple options or no professional
- Loads available appointment times

### `selectEspecialidade(especialidade: Especialidade | null)`
**Behavior:**
- Filters `profissionaisFiltrados` to match specialty
- Called when user changes specialty selection

### `selectEmpresa(empresa: Empresa | null)`
**Behavior:**
- Sets `empresaSelecionada`
- Recalculates procedure values (price by plan)
- Called for all additional procedures too

### `selectConvenio(convenio: Convenio | null)`
**Behavior:**
- Sets `convenioSelecionado`
- Recalculates procedure values (price by health insurance)
- Clears empresa auto-fill when changed

### `selectProcedimento(procedimento: Procedimento | null)`
**Behavior:**
- Calculates procedure value (main procedure)
- Calculates total duration based on procedure duration
- Never overwrites manually entered duration

### `carregarHorariosDisponiveis()`
**Behavior:**
- Fetches available times from API via `AgendamentoService`
- Creates map for quick hour lookup
- Clears hour selection if no times available
- Called when date or professional changes

### `onSelectHora()`
**Behavior:**
- When date/time selected, automatically fills duration from available time window
- Calculates: endTime - startTime

---

## 11. Additional Procedures Handling (FormArray)

### Structure
```typescript
procedimentos: FormArray [
  {
    quantidade: number (min: 1),
    procedimentoId: number (required),
    valor: number,
    valorExibicao: number,
    desconto: number
  },
  ...
]
```

### Methods

**`adicionarProcedimento()`**
- Creates a new FormGroup with empty values
- Adds to procedimentos FormArray
- Default quantity: 1

**`removerProcedimento(index: number)`**
- Removes procedure at index
- Recalculates total value
- Recalculates total duration

**`calcularValorProcedimento(index: number | null)`**
**Purpose:** Calculate procedure price based on patient's plan

**Logic (Priority Order):**
1. **Health Insurance (Convenio)** → Fetch from ProcedimentoService
2. **Business Plan (Empresa.plano)** → Fetch from ProcedimentoService
3. **Particular (Default)** → Fetch standard price
4. On error at any level, fallback to next priority

**Parameters:**
- `index = null`: Calculate main procedure (`procedimentoId`)
- `index >= 0`: Calculate additional procedure at that index

**Called When:**
- Selecting convenience/plan changes
- Company changes
- User adds/modifies an additional procedure

---

## 12. Value Calculation Methods

### `calcularValorTotal()`
**Formula:**
```
total = mainProcedure.valor + sum(procedimentos) - desconto
where sum(procedimentos) = sum(quantidade * valor - descontoProcedimento)
```

**Side Effects:**
- Updates `valorTotalAgendamento`
- Auto-fills `quantiaPaga` if payment type is 'pago'
- Calls `calcularQuantiaFaltante()`

**Called By:**
- Form initialization
- After loading rascunho/waiting list
- After selecting procedure/plan
- When value/discount changes
- When adding/removing procedures

### `calcularQuantiaFaltante()`
**Formula:**
```
quantiaFaltante = max(0, valorTotalAgendamento - quantiaPaga)
```

**Purpose:** Show remaining balance for partial payments

### `calcularDuracaoTotal()`
**Formula:**
```
total = procedimentoPrincipal.duracao + 
        sum(procedimentos with quantidade * procedimento.duracao)
```

**Behavior:**
- Only updates if duration field is empty (user hasn't manually entered)
- Once user enters duration, doesn't recalculate
- Called when procedure changes

---

## 13. Price Edit Control Methods

### `solicitarHabilitacaoValor()`
**Behavior:**
- If admin already approved: call `editaValor()`
- Else: show credentials modal
- Sets `campoParaEditar = 'valor'`

### `editaValor()`
**Behavior:**
- Store current value in `valorAntesEdicao`
- Enable `valor` field
- Set `precoAlterado = true` flag
- Mark form as pristine

### `cancelarEdicaoValor()`
**Behavior:**
- Restore original value
- Set `precoAlterado = false`
- Disable field
- Recalculate total

### Similar methods for Discount:
- `solicitarHabilitacaoDesconto()`
- `editaDesconto()`
- `cancelarEdicaoDesconto()`

### Admin Validation Flow:
**`validarCredenciaisAdmin(credenciais)`**
1. Call `AuthService.validarAdmin()`
2. If valid: grant permission, enable editing
3. If invalid: show error toast

---

## 14. Save Methods

### `onSubmit()` (Override)
**Main Entry Point:**
- Check if `filaEspera` flag is set
- If yes: call `salvarFilaEspera()`
- If no: validate form and emit `save` event

**Validation:**
- Form must be valid
- Desconto cannot exceed valor
- Gets raw form value (includes disabled fields)
- Clears draft before saving

### `salvarFilaEspera()`
**Purpose:** Save to waiting list instead of creating agendamento

**Validates:**
- pacienteId required
- especialidadeId required

**Creates FilaEsperaRequest with:**
- Required: pacienteId, especialidadeId
- Optional: all other agendamento fields

**Clears draft after success**

### `salvarRascunho()`
**Purpose:** Save incomplete form as draft

**Stores:**
- All form values
- Gets raw value (disabled fields included)
- Stores via `AgendamentoRascunhoService`

**Behavior:**
- Mark as pristine and show success toast
- Close form without saving

---

## 15. Draft and Waiting List Loading

### `carregarDadosRascunho(rascunho: any)`
**Behavior:**
- Patch all form fields from saved draft
- Reload related selections (patient, professional, empresa, etc.)
- Load additional procedures from draft
- Set payment type from draft
- Called in ngOnInit if draft exists and no pre-selected patient/professional

### `carregarDadosFilaEspera(filaEspera: FilaEspera)`
**Behavior:**
- Set current time if not provided
- Patch all available fields from waiting list record
- Select patient and other related entities
- Slight delay (100ms setTimeout) to ensure proper loading order
- Called in ngOnInit if FilaEspera input provided

---

## 16. Status Management Methods

### `getStatusOptions()`
**Returns:** Array of status enum values with descriptions and colors
**Format:** `{ value: StatusAgendamentoEnum, descricao: string, cor: string }`

### `onStatusChange(statusValue: any)`
**Behavior:**
- Extract value from object or use directly if primitiv
- Patch form with status value

### Status-Related Actions:

**`marcarNaoCompareceu()` / `confirmarNaoCompareceu()`**
- Mark as no-show
- Call `AgendamentoService.marcarNaoCompareceu()`
- Emit cancel event on success

**`marcarCanceladoPeloUsuario()` / `confirmarCanceladoPeloUsuario()`**
- Mark as cancelled by user
- Call `AgendamentoService.marcarCanceladoPeloUsuario()`
- Emit cancel event on success

**`excluirAgendamento()` / `confirmarExclusao()`**
- Delete agendamento
- Call `AgendamentoService.excluir()`
- Emit cancel event on success

---

## 17. Attendance Opening

### `podeAbrirAtendimento(agendamento: Agendamento | null): boolean`
**Conditions:**
- Agendamento must exist
- Agendamento must allow opening (checked via `podeAbrirAtendimento()` function)
- User must be a doctor/medico

### `abrirAtendimento(agendamento: Agendamento | null)`
**Flow:**
1. Get agendamento ID
2. Call `AtendimentoService.iniciarAtendimento()`
3. Navigate to attendance page with agendamento and attendance IDs
4. Show loading state

---

## 18. UI State Properties

| Property | Type | Purpose |
|----------|------|---------|
| `titulo` | `string` | Form title (changes based on mode) |
| `modoSalvar` | `boolean` | True = new/editable, False = view mode |
| `isLoading` | `boolean` | Show loading indicator |
| `hoje` | `string` | Today's date (ISO format) |
| `mostrarFormularioNovoPaciente` | `boolean` | Show patient creation form |
| `rascunhoCarregado` | `boolean` | Track if draft was loaded |
| `valorEditavel` | `boolean` | Allow price editing |
| `descontoEditavel` | `boolean` | Allow discount editing |
| `mostrarModalCredenciais` | `boolean` | Show admin auth dialog |
| `tipoPagamento` | `'pago' \| 'parcial'` | Payment type toggle |
| `permissaoAdminValorConcedida` | `boolean` | Admin approved price edit |
| `permissaoAdminDescontoConcedida` | `boolean` | Admin approved discount edit |
| `exibeConfirmNaoCompareceu` | `boolean` | Show no-show confirmation |
| `exibeConfirmExclusao` | `boolean` | Show delete confirmation |
| `exibeConfirmCanceladoPeloUsuario` | `boolean` | Show cancellation confirmation |
| `valorEditavel` | `boolean` | Allow manual price entry |
| `valorTotalAgendamento` | `number` | Calculated total |
| `quantiaFaltante` | `number` | Remaining balance |

---

## 19. Data Collections

| Property | Type | Purpose |
|----------|------|---------|
| `pacientes` | `Paciente[]` | Full list |
| `pacientesFiltrados` | `Paciente[]` | Search results |
| `pacientesParaExibicao` | `Array<Paciente & {displayLabel?}>` | With formatted display names |
| `searchCache` | `Map<string, Paciente[]>` | Cache search results |
| `convenios` | `Convenio[]` | Full list |
| `especialidades` | `Especialidade[]` | Full list |
| `especialidadesFiltradas` | `Especialidade[]` | Filtered by professional |
| `profissionais` | `Profissional[]` | Full list |
| `profissionaisFiltrados` | `Profissional[]` | Filtered by specialty |
| `empresas` | `Empresa[]` | Full list |
| `procedimentos` | `Procedimento[]` | Full list |
| `horariosDisponiveis` | `HorarioDisponivel[]` | Available times for selected date/professional |
| `mapaHorariosDisponiveis` | `Map<string, HorarioDisponivel>` | Time lookup map |

---

## 20. Utility Methods

### `onSearch(event: { term: string })`
- **Purpose:** Filter patients by name/CPF with caching
- **Features:**
  - Cache up to 50 searches
  - Limit results to 100 items for performance
  - Show first 50 if no search term

### `formatarPacienteDisplay(paciente: Paciente): string`
- **Returns:** Formatted string like "Nome - DD/MM/YYYY - CPF"
- **Used:** For dropdown display labels

### `converterParaNumero(valor: any): number`
- **Converts:** String/number/null to number
- **Handles:** Brazilian format (dots for thousands, comma for decimal)
- **Returns:** 0 if invalid/empty

### `alterouValor($event: Event)`
- **Triggers:** Recalculate totals when value changes

### `alterouDesconto($event: Event)`
- **Triggers:** Recalculate totals when discount changes

### `selecionarTipoPagamento(tipo: 'pago' | 'parcial')`
- **Pago:** Auto-fill `quantiaPaga` with total value
- **Parcial:** Set `quantiaPaga = 0`
- **Recalculates:** Remaining balance

### `podeCarregarHorarios(): boolean`
- **Returns:** True if both profissionalId and data are set

### `podeEditar(): boolean`
- **Returns:** True if:
  - User is not a doctor
  - Not in save mode
  - Agendamento exists
  - Agendamento can be edited

### `formValido(): boolean`
- **Validates:**
  - Form is valid
  - Desconto ≤ valor
  - Shows warning toast if invalid

### `fechar(confirmou: boolean)`
- **Behavior:**
  - If dirty form and no confirmation: ask for confirmation
  - Else: emit cancel event

---

## 21. Key Constants and Protected Properties

```typescript
protected readonly StatusAgendamento        // Status display info
protected readonly StatusAgendamentoEnum    // Status enum values
protected readonly autoResize                // Utility function reference
protected readonly limitLength               // Utility function reference
protected readonly ColorUtils                // Color utility reference

formasPagamento = FORMAS_PAGAMENTO          // Payment methods list
tipoAgendamento = TIPO_AGENDAMENTO          // Appointment types list
```

---

## 22. Form State Management

### Disabled Fields:
- **Edit Mode:** All fields disabled initially, `pacienteId` always disabled
- **New Mode:** `valor` and `desconto` disabled until admin approval or new agendamento
- **Only enabled after:** `solicitarHabilitacaoValor()` or `solicitarHabilitacaoDesconto()`

### Pristine/Dirty Tracking:
- Form marked as pristine after loading data
- Marked as prestine after saving draft
- Used to prompt save confirmation on close

### Validation:
- Required fields: pacienteId, data, hora, duracao, tipoAgendamento, profissionalId, especialidadeId, procedimentoId
- Custom: desconto ≤ valor
- Validators applied at field level

---

## 23. How to Create Similar Form for "Orcamento"

### Key Differences to Consider:

1. **Main Entity:** Instead of agendamento with procedures, use orcamento structure
2. **Date/Time:** May not need time or may have different duration semantics
3. **Patient/Professional:** Keep similar structure for selection
4. **Procedures:** Keep FormArray approach for budget line items
5. **Pricing:** May need different price calculation logic
6. **Status:** Different status enum for quote workflow (pending, accepted, rejected, etc.)
7. **Services Used:** Mirror the pattern with OrcamentoService, etc.

### Recommended Structure:

```typescript
Form Controls:
├── pacienteId (required)
├── data (required, maybe "data da emissão")
├── profissionalId (optional?)
├── empresaId (optional)
├── convenioId (optional)
├── observacoes
├── valor (with admin control)
├── desconto (with admin control)
├── formaPagamento
├── status
└── itens: FormArray [
    ├── procedimentoId
    ├── quantidade
    ├── valor
    ├── desconto
]
```

### Services to Create:
- `OrcamentoService` (mirrors AgendamentoService)
- `OrcamentoRascunhoService` (mirrors AgendamentoRascunhoService) - optional

### Reusable Pattern:
- Use same `FormComponent` base class
- Use same @Input/@Output event system
- Use FormArray for line items
- Use same price calculation hierarchy (Convenio > Empresa > Particular)
- Use same admin credentials control for sensitive fields
- Use same toastr notifications

---

## 24. Important Notes

### Data Format:
- **Dates:** ISO string format (yyyy-MM-dd) for input[type="date"]
- **Time:** HH:mm format (24-hour)
- **Duration:** Minutes as number
- **Currency:** Number with potential conversion from Brazilian format

### Service Calls:
- All HTTP calls use RxJS Observables
- forkJoin for parallel loading (ngOnInit)
- Tap operator for side effects (storing data)
- Subscribe pattern with next/error handlers

### Form Submission:
- Uses `getRawValue()` to include disabled fields
- Emits to parent via `save` EventEmitter
- Handles routing after service success

### Breadcrumb/Navigation:
- Uses Router for navigation after operations
- Passes state via router navigation extras
- Emits cancel for parent handling

---

## 25. Complete Method Call Chain Examples

### New Agendamento Flow:
```
1. Component created → constructor
2. ngOnInit starts
3. forkJoin loads all data
4. Check if agendamentoDetalhes exists (no - new mode)
5. Load rascunho if exists
6. If pacienteId provided → selectPaciente()
7. If profissionalId provided → selectProfissional()
8. Listen to date changes
9. calcularValorTotal()
10. Ready for user input
```

### Select Professional Flow:
```
1. selectProfissional(profissionalId)
2. Filter especialidadesFiltradas
3. Auto-select if only one specialty
4. carregarHorariosDisponiveis()
5. Fetch times from API
6. Store in map for quick lookup
```

### Save Agendamento Flow:
```
1. User clicks Save
2. onSubmit() called
3. Validate form
4. Get raw values (includes disabled fields)
5. Clear rascunho
6. emit save.emit(formData)
7. Parent component makes API call
8. On success → navigate away
```

### Edit Flow:
```
1. agendamentoDetalhes set
2. ngOnInit → carregaDadosAgendamento()
3. Load procedures into FormArray
4. Disable entire form
5. User clicks Edit
6. onEdit() → enable form except pacienteId
7. User makes changes
8. onSubmit() → save with updated values
```

---

## Summary Table

| Aspect | Details |
|--------|---------|
| **Form Type** | Reactive Form (FormBuilder) |
| **Base Class** | FormComponent (generic) |
| **Main Entities** | Agendamento with related Paciente, Profissional, Specs, etc. |
| **Line Items** | Procedimentos (FormArray) |
| **Price Calculation** | Hierarchy: Convenio > Empresa.Plano > Particular |
| **Modes** | New, Edit, View |
| **Save Target** | Agendamento or FilaEspera (waiting list) |
| **Rascunho** | Draft auto-save feature |
| **Admin Controls** | Value/Discount require credentials |
| **Status Management** | Multiple status change actions (no-show, cancel, delete) |
| **Time Selection** | Auto-filled duration from available slot |
| **Key UI Patterns** | Confirmation modals, credential modals, toastr notifications |
| **Performance** | Search caching, limited result sets, forkJoin for parallel loads |
