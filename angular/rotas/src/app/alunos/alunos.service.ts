import { Injectable } from '@angular/core';

@Injectable()
export class AlunosService {

  private alunos: any[] = [
    {id: 1, nome: 'Aluno 1', email: 'aluno1@gmail.com'},
    {id: 2, nome: 'Aluno 2', email: 'aluno2@gmail.com'},
    {id: 3, nome: 'Aluno 3', email: 'aluno3@gmail.com'},
    {id: 4, nome: 'Aluno 4', email: 'aluno4@gmail.com'}
  ];

  getAlunos(){
    return this.alunos;
  }
  
  getAluno(id: number){
    for(let aluno of this.alunos){
      if(aluno.id == id) return aluno;
    }
    return null;
  }
  
  salvarAluno(id, nome: string, email: string){
    let len = this.alunos.length + 1;
    if(id == undefined || id == null) id = len;
    let index = this.alunos.map(function(aluno) { return parseInt(aluno.id); }).indexOf(parseInt(id));
    let obj = {id: parseInt(id), nome: nome, email: email};
    if(index!=-1){
      this.alunos[index] = obj;
    } else {
      this.alunos.push(obj);
    }
    return id;
  }

  constructor() { }

}
