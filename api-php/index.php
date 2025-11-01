<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require __DIR__ . '/vendor/autoload.php';

$app = AppFactory::create();

$app->get('/', function (Request $request, Response $response, array $args) {
    $response->getBody()->write("Hello, world!");
    return $response;
});

$app->post('/', function (Request $request, Response $response, array $args) {
    $body = json_decode($request->getBody()->getContents(), true);

    $number = (int) $body['number'];

    $payload = json_encode(['is_prime' => is_prime($number)], JSON_PRETTY_PRINT);
    $response->getBody()->write($payload);
    return $response->withHeader('Content-Type', 'application/json');
});

function is_prime(int $number): bool
{
    if ($number < 2) return false;

    for ($i = 2; $i <= sqrt($number); $i++) {
        if ($number % $i === 0) {
            return false;
        }
    }

    return true;
}

$app->run();