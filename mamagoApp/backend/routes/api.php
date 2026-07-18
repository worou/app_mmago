<?php

use App\Http\Controllers\Api\AboutController;
use App\Http\Controllers\Api\ContentController;
use App\Http\Controllers\Api\JobOfferController;
use App\Http\Controllers\Api\LeadController;
use App\Http\Controllers\Api\PostController;
use Illuminate\Support\Facades\Route;

/*
| Public read endpoints backing the site, plus the lead capture the contact
| and "Télécharger l'app" forms post to. No auth: nothing here is
| user-specific.
*/

// Landing page
Route::get('/content', [ContentController::class, 'index']);
Route::get('/services', [ContentController::class, 'services']);
Route::get('/countries', [ContentController::class, 'countries']);
Route::get('/stats', [ContentController::class, 'stats']);
Route::get('/guarantees', [ContentController::class, 'guarantees']);

// Pays
Route::get('/coverage', [ContentController::class, 'coverage']);

// À propos
Route::get('/about', [AboutController::class, 'index']);

// Blog
Route::get('/posts', [PostController::class, 'index']);
Route::get('/posts/{post}', [PostController::class, 'show']);

// Carrières
Route::get('/job-offers', [JobOfferController::class, 'index']);
Route::get('/job-offers/{jobOffer}', [JobOfferController::class, 'show']);

// Contact / téléchargement
Route::post('/leads', [LeadController::class, 'store'])->middleware('throttle:10,1');
