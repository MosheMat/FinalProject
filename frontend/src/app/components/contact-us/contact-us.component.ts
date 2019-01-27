import { Component } from '@angular/core';
import { ContactUs } from '../../models/contactUs';
import { ContactUsService } from '../../services/contact_us.service';
import { Router } from "@angular/router";
@Component({
    selector: 'app-contact-us',
    templateUrl: './contact-us.component.html',
    styleUrls: ['./contact-us.component.css']
})
export class ContactUsComponent {

    public constructor(private contactUsService: ContactUsService, private router:Router) { }

    public contactUs: ContactUs = new ContactUs();

    public send(): void {
        this.contactUsService.addContactUsRequest(this.contactUs).subscribe(c => {
            alert("Message has been sent");
        },
        error =>{
          this.router.navigate(['/404'])
        });
    }
}
