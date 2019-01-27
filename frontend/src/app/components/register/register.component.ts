import { Component, OnInit } from '@angular/core';
import { User } from '../../models/user';
import { UsersService } from '../../services/users.service';
import {Router} from "@angular/router";

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent  {

  
  public constructor(private userService: UsersService, private  router: Router) { }

  public user: User = new User();

  public send(): void {
      this.userService.addUserRequest(this.user).subscribe(u => {
          if (u == null){
            alert("the user name already exist, please choose diffrent one")
          }
          else{
            alert ("you register us successfully")
            localStorage.setItem('currentUser', JSON.stringify(u));
            this.router.navigate(['/game']);
          }
      },
      error =>{
        this.router.navigate(['/404'])
      });
  }
}