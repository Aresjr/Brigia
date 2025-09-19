import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetalhesAgendamentoComponent } from './detalhes-agendamento.component';

describe('DetalhesAgendamentoComponent', () => {
  let component: DetalhesAgendamentoComponent;
  let fixture: ComponentFixture<DetalhesAgendamentoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DetalhesAgendamentoComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DetalhesAgendamentoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
