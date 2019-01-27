import { Component, OnInit } from '@angular/core';
import { MatGridListModule } from '@angular/material/grid-list';
import { Cell } from 'src/app/models/cell';
import { ImagesService } from 'src/app/services/images.service';
import { Image } from 'src/app/models/image';
import { GameResultsService } from 'src/app/services/game_results.service';
import { GameResult } from 'src/app/models/gameResult';
import { LayoutComponent } from '../layout/layout.component';
import { User } from 'src/app/models/user';
import {Router} from "@angular/router";


@Component({
  selector: 'app-game',
  templateUrl: './game.component.html',
  styleUrls: ['./game.component.css']
})
export class GameComponent implements OnInit {
  constructor(private imagesService: ImagesService, private gameResultService: GameResultsService,private router:Router) { }
  public cells: Cell[] = [];
  public movesNum: number = 0;
  public previousCell: Cell;
  public startTime: Date;
  public gameDuration: number;
  public gameResult: GameResult = new GameResult();
  public currentUser: User;


  ngOnInit() {
    this.currentUser = JSON.parse(localStorage.getItem('currentUser')) as User
    if (this.currentUser == null) {
      setTimeout(() => {
        alert("you must login to play the game");
      }, 500);

      return;
    }
    this.newGame();
  }

  public imgSelect(cell: Cell): void {
    if (cell.isChoosen){
      return;
    }
    cell.imgSrc = cell.imgPath;
    cell.isChoosen = true;
    this.movesNum++;
    if (this.movesNum % 2 == 0) {
      if (this.isImagesMatched(cell)) {
        cell.isMatched = true;
        this.previousCell.isMatched = true;
      }
      else {
        setTimeout(() => {
          cell.imgSrc = "";
          this.previousCell.imgSrc = "";
          cell.isChoosen = false;
          this.previousCell.isChoosen = false;
        }, 1000);
      }
      if (this.isGameOver()) {
        this.whenGameOver();
      }
    }
    else{
        this.previousCell = cell;
    }
  }
  public isImagesMatched(currentCell: Cell): boolean {
    if (currentCell.imgPath == this.previousCell.imgPath) {
      return true;
    }
    return false;
  }

  public isGameOver(): boolean {
    for (let i = 0; i <= this.cells.length - 1; i++) {
      if (!this.cells[i].isChoosen || !this.cells[i].isMatched) {
        return false;
      }
    }
    return true;
  }
  
  public newGame(): void {
    this.startTime = new Date();
    this.movesNum = 0;
    this.imagesService.getImages().subscribe((images) => {

      for (let s = 0; s <= 19; s++) {
        this.cells[s] = new Cell();
        this.cells[s].isChoosen == true;
        this.cells[s].isMatched == true;
      }
      for (let i = 0; i <= 9; i++) {
        for (let j = 0; j <= 1; j++) {
          let randomCell: number = Math.floor(Math.random() * 20);
          while (this.cells[randomCell].imgPath != "") {
            randomCell = Math.floor(Math.random() * 20);
          }
          this.cells[randomCell].imgPath = images[i].filePath;
        }
      }
    },
    error =>{
      this.router.navigate(['/404'])
    });
  }
  public whenGameOver() {
    this.gameDuration = Math.floor((new Date().getTime() - this.startTime.getTime()) / 1000);
    this.gameResult.userName = this.currentUser.userName;
    this.gameResult.userId = this.currentUser.id;
    this.gameResult.movesNum = this.movesNum / 2;
    this.gameResult.gameDuration = this.gameDuration;
    this.gameResult.gameTime = this.startTime;
    this.gameResultService.addGameResult(this.gameResult).subscribe();
    setTimeout(() => {
      alert("you win the game!!")
      this.router.navigate(['/game-results'])
    }, 1000);
  }
}

