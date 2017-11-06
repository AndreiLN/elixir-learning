import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-diretiva-ngfor',
  templateUrl: './diretiva-ngfor.component.html',
  styleUrls: ['./diretiva-ngfor.component.css']
})
export class DiretivaNgforComponent implements OnInit {
  tecnologias = ['Elixir','Typescript','Angular 2','HTML5','CSS3','Javascript'];
  
  constructor() { }

  ngOnInit() {
  }

}
