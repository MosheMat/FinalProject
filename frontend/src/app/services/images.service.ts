import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Image } from '../models/image';

@Injectable({
    providedIn: 'root'
})
export class ImagesService {
 
    constructor(private httpClient: HttpClient) { }

    public getImages(): Observable<Image[]> {
        return this.httpClient.get<Image[]>("http://localhost:61607/api/images");
    }
}