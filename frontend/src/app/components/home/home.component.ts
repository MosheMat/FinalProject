import { Component, OnInit, OnDestroy } from '@angular/core';
import { Title } from '@angular/platform-browser';

@Component({
    selector: 'app-home',
    templateUrl: './home.component.html',
    styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit, OnDestroy {

 

    constructor(private pageTitle: Title) { } 

    ngOnInit() {
      
    }

    
    ngOnDestroy(): void {

    }

}