import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { LayoutComponent } from '../components/layout/layout.component';
import { HeaderComponent } from '../components/header/header.component';
import { HomeComponent } from '../components/home/home.component';
import { HeadlineComponent } from '../components/headline/headline.component';
import { FormsModule } from "@angular/forms";
import { RoutingModule } from './routing.module';
import { RouterModule } from '@angular/router';
import { Page404Component } from '../components/page404/page404.component';
import { MenuComponent } from '../components/menu/menu.component';
import { ThumbnailComponent } from '../components/thumbnail/thumbnail.component';
import { HttpClientModule } from "@angular/common/http";
import { FeedBacksComponent } from '../components/feedbacks/feedbacks.component';
import { ContactUsComponent } from '../components/contact-us/contact-us.component';
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { MatIconModule, MatInputModule, MatButtonModule, MatCheckboxModule, MatGridListModule } from "@angular/material";
import { RegisterComponent } from '../components/register/register.component';
import { GameResultComponent } from '../components/game-result/game-result.component';
import { LoginComponent } from '../components/login/login.component';
import { GameComponent } from '../components/game/game.component';
import { FeedbackComponent } from '../components/feedback/feedback.component';
import { AboutComponent } from '../components/about/about.component';

@NgModule({
    declarations: [
        LayoutComponent,
        HeaderComponent,
        HomeComponent,
        HeadlineComponent,
        Page404Component,
        MenuComponent,
        ThumbnailComponent,
        FeedBacksComponent,
        ContactUsComponent,
        RegisterComponent,
        GameResultComponent,
        LoginComponent,
        GameComponent,
        FeedbackComponent,
        AboutComponent
    ],
    imports: [
        BrowserModule,
        BrowserAnimationsModule,
        FormsModule,
        RoutingModule,
        RouterModule,
        HttpClientModule,
        MatGridListModule,
        MatInputModule,
        MatButtonModule,
        MatCheckboxModule,
        MatIconModule,
    ],
    bootstrap: [LayoutComponent]
})
export class AppModule { }
