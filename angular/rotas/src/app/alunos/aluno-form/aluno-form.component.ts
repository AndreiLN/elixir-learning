import { Component, OnInit, OnDestroy } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Subscription } from 'rxjs/Rx';

import { AlunosService } from '../alunos.service';
@Component({
  selector: 'app-aluno-form',
  templateUrl: './aluno-form.component.html',
  styleUrls: ['./aluno-form.component.css']
})
export class AlunoFormComponent implements OnInit {
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
      if(aluno != null && aluno != undefined){
        this.aluno = aluno;
      }
    });
  }
  
  ngOnDestroy() {
    this.inscricao.unsubscribe();
  }
  
  salvarAluno(nome: string, email: string){
    this._router.navigate(['alunos',this._alunosService.salvarAluno(this.id,nome,email)]);
  }
  
}
