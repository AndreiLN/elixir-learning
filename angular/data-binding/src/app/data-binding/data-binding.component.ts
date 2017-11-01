import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-data-binding',
  templateUrl: './data-binding.component.html',
  //styleUrls: ['./data-binding.component.css']
  styles: [
  `
  .highlight {
      background-color: yellow;
      font-weight: bolder;
  }
  `  
  ]
})
export class DataBindingComponent implements OnInit {
  url: string = 'https://github.com/AndreiLN/elixir-learning';
  urlImagem: string = 'http://lorempixel.com/400/200/city/';
  cursoAngular: boolean = true;
  
  valorAtual: string = "";
  valorSalvo: string = "";
  
  isMouseOver: boolean = false;
  
  nomeCurso: string = "Angular";
  
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
  
  constructor() { }

  ngOnInit() {
  }

}
