import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ContactUs } from '../models/contactUs';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class ContactUsService {

    constructor(private httpClient: HttpClient) { }

    public addContactUsRequest(contact_us: ContactUs): Observable<ContactUs> {
        return this.httpClient.post<ContactUs>("http://localhost:61607/api/contact-us", contact_us);
    }

}
