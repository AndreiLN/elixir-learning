import { Component, OnInit } from '@angular/core';

import { HeaderService } from './header.service';

declare var jquery:any;
declare var $ :any;

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
  providers: [HeaderService]
})
export class HeaderComponent implements OnInit {
  menu: Array<any>;
  
  constructor(private _headerService: HeaderService){};
  
  ngOnInit(){
    $(document).ready(function(){
      $(".button-collapse").sideNav();
    });
    this.menu = this._headerService.getMenu();
  }
}
