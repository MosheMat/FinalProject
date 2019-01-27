import { Component, OnInit } from '@angular/core';
import { GameResult } from 'src/app/models/gameResult';
import { GameResultsService } from 'src/app/services/game_results.service';
import { Router } from "@angular/router";

@Component({
  selector: 'app-game-result',
  templateUrl: './game-result.component.html',
  styleUrls: ['./game-result.component.css']
})
export class GameResultComponent implements OnInit {

  public gameResults: GameResult[];

  constructor(private gameResultsService: GameResultsService, private router: Router) { }

  ngOnInit() {
      this.gameResultsService.getGameResults().subscribe((gameResult) => {
          this.gameResults = gameResult;
      },
      error =>{
        this.router.navigate(['/404'])
      });
  }
}
