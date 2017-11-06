import { Directive } from '@angular/core';

@Directive({
  selector: '[ngElse]'
})
export class NgElseDirective {
  mostrarCursos = false;
  
  onMostrarCursos(){
    this.mostrarCursos = !this.mostrarCursos;
  }
  
  constructor() { }

}
