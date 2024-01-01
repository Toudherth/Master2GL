import { Component } from '@angular/core';

@Component({
  selector: 'app-addproduit',
  templateUrl: './addproduit.component.html',
  styleUrls: ['./addproduit.component.css']
})
export class AddproduitComponent {


  StudentArray : any[] = [];


  productname: string ="";
  productadresse: string ="";
  productmobile: Number =0;


  sav(){
    return null;
  }
}
