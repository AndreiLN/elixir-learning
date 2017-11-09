import { Injectable } from '@angular/core';

@Injectable()
export class HeaderService {

  constructor() { }
  
  getMenu(){
    return [
      {caption: 'Cursos', link: 'cursos'},
      {caption: 'Login', link: 'login'}
    ];
  }

}
