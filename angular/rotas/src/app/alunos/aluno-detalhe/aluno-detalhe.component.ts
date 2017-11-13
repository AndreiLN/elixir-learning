import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs/Rx';

import { AlunosService } from '../alunos.service';

@Component({
  selector: 'app-aluno-detalhe',
  templateUrl: './aluno-detalhe.component.html',
  styleUrls: ['./aluno-detalhe.component.css']
})
export class AlunoDetalheComponent implements OnInit, OnDestroy {
  
  id: number;
  aluno: any;
  inscricao: Subscription;
  
  constructor(private _route: ActivatedRoute, 
    private _alunosService: AlunosService,
    private _router: Router) { }

  ngOnInit() {
    this.inscricao = this._route.params.subscribe((params: any) => {
      this.id = params['id'];
      let aluno = this._alunosService.getAluno(this.id);
      if(aluno == null || aluno == undefined){
        //this._router.navigate(['/curso-nao-encontrado']);
      } else {
        this.aluno = aluno;
      }
    });
  }
  
  ngOnDestroy() {
    this.inscricao.unsubscribe();
  }

}
