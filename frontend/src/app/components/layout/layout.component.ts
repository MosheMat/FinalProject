import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { User } from 'src/app/models/user';
import { JsonPipe } from '@angular/common';

@Component({
    selector: 'app-layout',
    templateUrl: './layout.component.html',
    styleUrls: ['./layout.component.css'],
})
export class LayoutComponent implements OnInit {
    public static currentUser:User= new User();

    constructor() { }

    ngOnInit() {
        LayoutComponent.currentUser= JSON.parse( localStorage.getItem('currentUser'))as User;
    }

}
