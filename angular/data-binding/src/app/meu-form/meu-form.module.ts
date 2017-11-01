import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { MeuFormComponent } from './meu-form.component';

@NgModule({
  imports: [
    FormsModule,
    CommonModule
  ],
  declarations: [MeuFormComponent],
  exports: [MeuFormComponent]
})
export class MeuFormModule { }
