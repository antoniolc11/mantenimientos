<?php

function conectar()
{
    return new PDO('pgsql:host=localhost;dbname=prueba_proyecto1', 'antoniolc11', 'Antonio11@');
}

function hh($x)
{
    return htmlspecialchars($x, ENT_QUOTES | ENT_SUBSTITUTE);
}
