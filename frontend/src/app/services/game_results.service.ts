import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { GameResult } from '../models/gameResult';

@Injectable({
    providedIn: 'root'
})
export class GameResultsService {
 
    constructor(private httpClient: HttpClient) { }

    public getGameResults(): Observable<GameResult[]> {
        return this.httpClient.get<GameResult[]>("http://localhost:61607/api/gameresults");
    }
    public addGameResult(gameResult: GameResult): Observable<GameResult> {
        return this.httpClient.post<GameResult>("http://localhost:61607/api/gameresults", gameResult);
    }
}
