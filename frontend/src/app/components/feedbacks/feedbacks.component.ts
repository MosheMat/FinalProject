import { Component, OnInit } from '@angular/core';
import { Feedback } from '../../models/feedback';
import { FeedbackService } from '../../services/feedbacks.service';
import { Router } from "@angular/router";

@Component({
    selector: 'app-all-feedbacks',
    templateUrl: './feedbacks.component.html',
    styleUrls: ['./feedbacks.component.css']
})
export class FeedBacksComponent implements OnInit {

    public feedbacks: Feedback[];

    constructor(private feedbacksService: FeedbackService, private router:Router) { }

    ngOnInit() {
        this.feedbacksService.getFeedbacks().subscribe((feedback) => {
            this.feedbacks = feedback;
        },
        error =>{
          this.router.navigate(['/404'])
        });
    }

}
