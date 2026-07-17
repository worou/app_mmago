<?php

return [

    'paths' => ['api/*'],

    'allowed_methods' => ['*'],

    // Scoped to the Vite dev server rather than the framework's default '*'.
    // Add the production origin here when the site is deployed.
    'allowed_origins' => array_filter([
        env('FRONTEND_URL', 'http://localhost:5180'),
        'http://127.0.0.1:5180',
    ]),

    'allowed_origins_patterns' => [],

    'allowed_headers' => ['*'],

    'exposed_headers' => [],

    'max_age' => 0,

    'supports_credentials' => false,

];
