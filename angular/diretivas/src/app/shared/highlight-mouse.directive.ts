import { Directive, HostListener, ElementRef, Renderer, HostBinding } from '@angular/core';

@Directive({
  selector: '[highlightMouse]'
})
export class HighlightMouseDirective {

  @HostListener('mouseenter') onMouseOver(){
    this.bkgColor = 'teal';
    this.color = 'white';
    // this._renderer.setElementStyle(this._elementRef.nativeElement, 'background-color', 'yellow');
  }
  @HostListener('mouseleave') onMouseLeave(){
    this.bkgColor = 'white';
    this.color = '#111';
    // this._renderer.setElementStyle(this._elementRef.nativeElement, 'background-color', 'white');
  }

  @HostBinding('style.backgroundColor') bkgColor: string;
  @HostBinding('style.color') color: string;
  
  constructor(/* private _elementRef: ElementRef,
              private _renderer: Renderer */) { }

}
