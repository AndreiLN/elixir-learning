import { Injectable } from '@angular/core';

@Injectable()
export class SettingsService {
  static Locale: string = "pt-BR";
  
  constructor() { }
  
  getLocale(){return SettingsService.Locale;}

}
