import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-data-binding',
  templateUrl: './data-binding.component.html',
  // styleUrls: ['./data-binding.component.css']
  styles: [
  `
  .highlight {
      background-color: yellow;
      font-weight: bolder;
  }
  `]
})
export class DataBindingComponent implements OnInit {
  url = 'https://github.com/AndreiLN/elixir-learning';
  urlImagem = 'http://lorempixel.com/400/200/city/';
  cursoAngular = true;
  valorAtual = "";
  valorSalvo = "";
  isMouseOver = false;
  nomeCurso = "Angular";
  valorInicial = 15;
  
  getValor(){ return 1; }
  
  botaoClicado(){
    alert('Olá');
  }
  
  onKeyUp(valor: string){
    this.valorAtual = valor;
  }
  
  salvarValor(valor: string){
    this.valorSalvo = valor;
  }
  
  getCurtirCurso(){ return true; }
  
  ouMouseOverOut(){
    this.isMouseOver = !this.isMouseOver
  }
  
  onMudouValor(evento){
    console.log(evento.novoValor);
  }
  
  constructor() { }

  ngOnInit() {
  }

}
