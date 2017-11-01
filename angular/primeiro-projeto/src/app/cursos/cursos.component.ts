import { Component, OnInit } from '@angular/core';

import { CursosService } from './cursos.service';

@Component({
  selector: 'app-cursos',
  templateUrl: './cursos.component.html',
  styleUrls: ['./cursos.component.css']
})
export class CursosComponent implements OnInit {
  nomePortal : string;
  exercicios : string[];
  constructor(private cursosService : CursosService) { 
    this.nomePortal = "https://github.com/AndreiLN/elixir-learning";
    //var servico = new CursosService();
    this.exercicios = this.cursosService.getExercicios();
  }

  ngOnInit() {
  }

}
