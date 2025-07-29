import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TabelaPrecosComponent } from './tabela-precos.component';

describe('TabelaPrecosComponent', () => {
  let component: TabelaPrecosComponent;
  let fixture: ComponentFixture<TabelaPrecosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TabelaPrecosComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TabelaPrecosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
