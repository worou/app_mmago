<?php
// =====================================================================
// MamaGo API - Configuration
// Les valeurs proviennent d'un fichier d'environnement (voir .env.example) :
//   - api/.env             : fichier actif, prioritaire (ecrit au deploiement)
//   - api/.env.<APP_ENV>   : selon la variable APP_ENV (defaut : development)
// A defaut de fichier, les valeurs par defaut ci-dessous correspondent a
// l'environnement de developpement XAMPP.
// =====================================================================

return (static function () {
    $dir = __DIR__;

    // 1. Fichier d'environnement a charger
    $appEnv = getenv('APP_ENV');
    if ($appEnv === false || $appEnv === '') {
        $appEnv = $_SERVER['APP_ENV'] ?? 'development';
    }
    $candidates = ["$dir/.env", "$dir/.env.$appEnv"];

    // 2. Parsing du premier fichier existant (format KEY=VALUE)
    $vars = [];
    foreach ($candidates as $file) {
        if (!is_file($file)) {
            continue;
        }
        foreach (file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES) as $line) {
            $line = trim($line);
            if ($line === '' || $line[0] === '#') {
                continue;
            }
            $eq = strpos($line, '=');
            if ($eq === false) {
                continue;
            }
            $key = trim(substr($line, 0, $eq));
            $val = trim(substr($line, $eq + 1));
            $len = strlen($val);
            if ($len >= 2 && ($val[0] === '"' || $val[0] === "'") && $val[$len - 1] === $val[0]) {
                $val = substr($val, 1, -1);   // retire des guillemets englobants
            }
            $vars[$key] = $val;
        }
        break;
    }

    // 3. Getter : fichier .env > variable d'environnement systeme > defaut
    $val = static function (string $key, $default = null) use ($vars) {
        if (array_key_exists($key, $vars) && $vars[$key] !== '') {
            return $vars[$key];
        }
        $env = getenv($key);
        if ($env !== false && $env !== '') {
            return $env;
        }
        return $default;
    };

    return [
        'db' => [
            'host'     => $val('DB_HOST', '127.0.0.1'),
            'port'     => (int) $val('DB_PORT', 3306),
            'database' => $val('DB_DATABASE', 'mamago'),
            'username' => $val('DB_USERNAME', 'root'),
            'password' => $val('DB_PASSWORD', ''),
            'charset'  => $val('DB_CHARSET', 'utf8mb4'),
        ],
        'base_path'            => $val('BASE_PATH', '/mamago/api'),
        'cors_allowed_origins' => $val('CORS_ALLOWED_ORIGINS', '*'),
        'jwt_secret'           => $val('JWT_SECRET', 'mamago-secret-key-change-me-in-prod'),
        'jwt_ttl'              => (int) $val('JWT_TTL', 28800),
    ];
})();
