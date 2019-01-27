export class GameResult {

 public constructor(
public id? : number,
public userId?:number,
public fullName?:string,
public userName?:string,
public gameTime?: Date,
public gameDuration?:number,
public movesNum? : number){
}
 }