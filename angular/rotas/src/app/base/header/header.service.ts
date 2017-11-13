import { Injectable } from '@angular/core';

@Injectable()
export class HeaderService {

  constructor() { }
  
  getMenu(){
    return [
      {caption: 'Cursos', link: 'cursos', query: {pagina:1}},
      {caption: 'Alunos', link: 'alunos', query: {}},
      {caption: 'Login', link: 'login', query: {}}
    ];
  }

}
