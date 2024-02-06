<?php

namespace App\Providers;

use Illuminate\pagination\paginator;
//use Illuminate\Contracts\Pagination\Paginator;
use Illuminate\Http\Resources\Json\PaginatedResourceResponse;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
        Paginator::useBootstrap();
    }
}
