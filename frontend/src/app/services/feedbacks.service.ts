import { Injectable } from '@angular/core';
import { Feedback } from '../models/feedback';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';

@Injectable({
    providedIn: 'root'
})
export class FeedbackService {
 
    constructor(private httpClient: HttpClient) { }

    public getFeedbacks(): Observable<Feedback[]> {
        return this.httpClient.get<Feedback[]>("http://localhost:61607/api/feedbacks");
    }
    public addFeedback(feedback: Feedback): Observable<Feedback> {
        try{
            return this.httpClient.post<Feedback>("http://localhost:61607/api/feedbacks", feedback);
        }
        catch (error)
        {
            console.log("bla");
            console.error(error);
        }
        
    }
    
}
