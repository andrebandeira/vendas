<?php

declare(strict_types=1);

namespace App\Handler\Vendedor;

use Core\Handler\MainHandler;
use Core\Json\JsonException;
use Core\Json\JsonMessage;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Zend\Http\Client;
use Zend\Http\Request;


class CadastrarVendedorHandler extends MainHandler
{
    public function handle(ServerRequestInterface $request) : ResponseInterface
    {
        try {
            $token = $this->getHeader($request, 'token');

            $id = $this->getPost($request, 'id-vendedor');

            if (!is_numeric($id)) {
                $id = '';
            }else {
                $id = '/'.$id;
            }

            $nome = $this->getPost($request, 'nome-vendedor');
            $email = $this->getPost($request, 'email-vendedor');

            $client = new Client();

            if ($id) {
                $client->setMethod(Request::METHOD_PUT);
            } else {
                $client->setMethod(Request::METHOD_POST);
            }

            $client->setUri('http://127.0.0.1/api/vendedor'.$id);
            $client->setHeaders([
                'token' => $token
            ]);
            $client->setParameterPost(
                [
                    'nome'              => $nome,
                    'email'             => $email
                ]
            );
            $result   = $client->send();
            $body     = $result->getBody();
            $resposta = json_decode($body);

            if ($result->getStatusCode() == 200) {
                return new JsonMessage($resposta->data);
            }

            throw new \Exception($resposta->error);
        } catch (\Exception $ex) {
            return new JsonException($ex);
        }
    }
}
