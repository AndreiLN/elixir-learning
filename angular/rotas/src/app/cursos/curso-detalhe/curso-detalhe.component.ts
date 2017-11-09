import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs/Rx';

import { CursosService } from '../cursos.service';

@Component({
  selector: 'app-curso-detalhe',
  templateUrl: './curso-detalhe.component.html',
  styleUrls: ['./curso-detalhe.component.css']
})
export class CursoDetalheComponent implements OnInit, OnDestroy {

  id: string;
  inscricao: Subscription;
  curso: any;

  constructor(
    private _route: ActivatedRoute, 
    private _cursosService: CursosService,
    private _router: Router) {
    //this.id = this._route.snapshot.params['id'];
  }

  ngOnInit() {
    this.inscricao = this._route.params.subscribe((params: any) => {
      this.id = params['id'];
      this.curso = this._cursosService.getCurso(parseInt(this.id));
      if(this.curso == null){
        this._router.navigate(['/curso-nao-encontrado']);
      }
    });
  }
  
  ngOnDestroy() {
    this.inscricao.unsubscribe();
  }

}
