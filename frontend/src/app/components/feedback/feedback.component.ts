import { Component, OnInit } from '@angular/core';
import { FeedbackService } from 'src/app/services/feedbacks.service';
import { Feedback } from 'src/app/models/feedback';
import { User } from 'src/app/models/user';
import { Router } from "@angular/router";

@Component({
  selector: 'app-feedback',
  templateUrl: './feedback.component.html',
  styleUrls: ['./feedback.component.css']
})
export class FeedbackComponent implements OnInit {

  public constructor(private feedbacksService: FeedbackService, private router: Router) { }
  public feedback: Feedback = new Feedback();
  public currentUser: User;

  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser')) as User
    if (this.currentUser == null) {
      setTimeout(() => {
        alert("you must login to add a feedback");
      }, 500);

      return;
    }
  }

  public send(): void {
    this.feedback.userId = this.currentUser.id;
    this.feedbacksService.addFeedback(this.feedback).subscribe(f => {
      alert("feedback add")
      this.router.navigate(['/feedbacks'])
    },
    error =>{
      this.router.navigate(['/404'])
    });
  }
}
