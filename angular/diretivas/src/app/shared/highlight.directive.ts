import { Directive, HostListener, ElementRef, Renderer, HostBinding, Input, OnInit } from '@angular/core';

@Directive({
  selector: '[highlight]'
})
export class HighlightDirective implements OnInit {

  @HostListener('mouseenter') onMouseOver(){
    this.bkgColor = this.highlighColor;
    // this._renderer.setElementStyle(this._elementRef.nativeElement, 'background-color', 'yellow');
  }
  @HostListener('mouseleave') onMouseLeave(){
    this.bkgColor = this.defaultColor;
    // this._renderer.setElementStyle(this._elementRef.nativeElement, 'background-color', 'white');
  }

  @HostBinding('style.backgroundColor') bkgColor: string;
  
  @Input() defaultColor = 'white';
  @Input('highlight') highlighColor = 'yellow';
  
  constructor(/* private _elementRef: ElementRef,
              private _renderer: Renderer */) {}
  ngOnInit(){
    this.bkgColor = this.defaultColor;
  }

}
