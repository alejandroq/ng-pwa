import {Component, NgModule} from '@angular/core';
import {RouterModule} from '@angular/router';

@Component({
  selector: 'loading-screen',
  template: `<h3>Hello World I am loading</h3>`
})
export class LoadingScreen {}

@NgModule({
  declarations: [LoadingScreen],
  imports: [
    RouterModule.forChild([
      {path: 'loading', component: LoadingScreen},
    ])
  ]
})
export class LoadingModule {}
