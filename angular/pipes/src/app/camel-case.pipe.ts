import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'camelCase'
})
export class CamelCasePipe implements PipeTransform {

  transform(value: any, args?: any): any { 
    return value.split(' ')
                .map(v => 
                  v.charAt(0).toUpperCase() + v.substr(1).toLowerCase()
                ).join(' ');
  }

}
