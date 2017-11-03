import { Component, OnInit, Input, Output, EventEmitter, ViewChild, ElementRef } from '@angular/core';

@Component({
  selector: 'contator',
  templateUrl: './output-property.component.html',
  styleUrls: ['./output-property.component.css']
  //outputs: ['mudouValor']
})
export class OutputPropertyComponent implements OnInit {
  
  @Input() valor: number = 0;
  
  @Output() mudouValor = new EventEmitter();
  
  @ViewChild('campoInput') campoValorInput: ElementRef;
  
  incrementa(){
    this.campoValorInput.nativeElement.value++;
    this.mudouValor.emit({novoValor: this.campoValorInput.nativeElement.value});
  }
  decrementa(){
    this.campoValorInput.nativeElement.value--;
    this.mudouValor.emit({novoValor: this.campoValorInput.nativeElement.value});
  }
  
  constructor() { }

  ngOnInit() {
  }

}
