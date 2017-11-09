import { Component, OnInit } from '@angular/core';
import { ActivatedRoute ,Router } from '@angular/router';

import { CursosService } from './cursos.service'; 

@Component({
  selector: 'app-cursos',
  templateUrl: './cursos.component.html',
  styleUrls: ['./cursos.component.css']
})
export class CursosComponent implements OnInit {

  cursos: Array<any>;
  pagina: number;

  constructor(
    private _route: ActivatedRoute,
    private _cursosService: CursosService,
    private _router: Router) { }

  ngOnInit() {
    this.cursos = this._cursosService.getCursos();
  }
  
  detalhesCurso(id: string){
    this._router.navigate(["/curso",id]);
  }

}
