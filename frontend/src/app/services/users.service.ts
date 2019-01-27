import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { User } from '../models/user';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class UsersService {

    constructor(private httpClient: HttpClient) { }

    public addUserRequest(user: User): Observable<User> {
        return this.httpClient.post<User>("http://localhost:61607/api/register", user);
    }
    public userLoginRequest(user: User): Observable<User> {
        return this.httpClient.post<User>("http://localhost:61607/api/login", user);
}
}