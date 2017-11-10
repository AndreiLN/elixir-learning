import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute ,Router } from '@angular/router';
import { Subscription } from 'rxjs/Rx';

import { CursosService } from './cursos.service'; 

@Component({
  selector: 'app-cursos',
  templateUrl: './cursos.component.html',
  styleUrls: ['./cursos.component.css']
})
export class CursosComponent implements OnInit, OnDestroy {

  cursos: Array<any>;
  pagina: number;
  inscricao: Subscription;

  constructor(
    private _route: ActivatedRoute,
    private _cursosService: CursosService,
    private _router: Router) { }

  ngOnInit() {
    this.cursos = this._cursosService.getCursos();
    
    this.inscricao = this._route.queryParams.subscribe((queryParams: any) => {
      this.pagina = queryParams['pagina'];
    });
  }
  
  ngOnDestroy(){
    this.inscricao.unsubscribe();
  }
  
  detalhesCurso(id: string){
    this._router.navigate(["/curso",id]);
  }
  
  proximaPagina(){
    this.pagina++;
    this._router.navigate(["/cursos"],{
      queryParams: {pagina: this.pagina}
    });
  }

}
