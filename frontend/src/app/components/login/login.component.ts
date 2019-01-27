import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user';
import { UsersService } from 'src/app/services/users.service';
import {Router} from "@angular/router";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent  {

  public constructor(private userService: UsersService, private  router: Router) { }

  public user: User = new User();

  public send(): void {
      this.userService.userLoginRequest(this.user).subscribe(u => {
          if (u!=null){
            alert("you logged in to our site");
            localStorage.setItem('currentUser', JSON.stringify(u));
            this.router.navigate(['/game']);
          }
          else{
            alert("the user name or the password is incorrect");

          }
      },
      error =>{
        this.router.navigate(['/404'])
      });
  }
  
}
