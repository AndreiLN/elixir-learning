import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

//import { CursosService } from './cursos.service';
import { CursosComponent } from './cursos.component';

@NgModule({
  imports: [
    CommonModule
  ],
  exports: [
    CursosComponent  
  ],
  providers: [/*CursosService*/],
  declarations: [CursosComponent]
})
export class CursosModule { }
