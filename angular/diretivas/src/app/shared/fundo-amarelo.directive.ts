import { Directive, ElementRef, Renderer } from '@angular/core';

@Directive({
  selector: 'p[fundoAmarelo]'
})
export class FundoAmareloDirective {

  constructor(private _elementRef: ElementRef,
              private _renderer: Renderer) { 
    // evitar usar o elementRef this._elementRef.nativeElement.style.backgroundColor = "yellow";
    
    //Elemento, nome do estilo, valor 
    this._renderer.setElementStyle(this._elementRef.nativeElement, 
    'background-color', 'yellow');
  }

}
