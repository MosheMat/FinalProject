import { NgModule } from '@angular/core';
import { Routes, RouterModule } from "@angular/router";
import { HomeComponent } from '../components/home/home.component';
import { Page404Component } from '../components/page404/page404.component';
import { FeedBacksComponent } from '../components/feedbacks/feedbacks.component';
import { ContactUsComponent } from '../components/contact-us/contact-us.component';
import { RegisterComponent } from '../components/register/register.component';
import { GameResultComponent } from '../components/game-result/game-result.component';
import { LoginComponent } from '../components/login/login.component';
import { GameComponent } from '../components/game/game.component';
import { FeedbackComponent } from '../components/feedback/feedback.component';
import { AboutComponent } from '../components/about/about.component';
const routes: Routes = [
    { path: "home", component: HomeComponent },
    { path: "about-me", component: AboutComponent },
    { path: "login", component: LoginComponent },
    { path: "game", component: GameComponent },
    { path: "feedbacks", component: FeedBacksComponent },
    { path: "contact-us", component: ContactUsComponent },
    { path: "register", component: RegisterComponent },
    { path: "game-results", component: GameResultComponent },
    { path: "feedback", component: FeedbackComponent },
    { path: "", redirectTo: "/home", pathMatch: "full" },
    { path: "**", component: Page404Component }
];

@NgModule({
    imports: [
        // Import the above routes into this module:
        RouterModule.forRoot(routes)
    ],
    declarations: []
})
export class RoutingModule { }