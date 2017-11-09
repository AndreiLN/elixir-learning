import { Injectable } from '@angular/core';

@Injectable()
export class HeaderService {

  constructor() { }
  
  getMenu(){
    return [
      {caption: 'Cursos', link: 'cursos', query: {pagina:1}},
      {caption: 'Login', link: 'login', query: {}}
    ];
  }

}
