<?php

require 'vendor/autoload.php';

class Template extends Smarty
{
    function __construct()
    {
        parent::__construct();
        $this->setTemplateDir(__DIR__ . './templates/');
        $this->setCacheDir(__DIR__ . "./cache/");
        $this->setCompileDir(__DIR__ . "./templates_c/");
        $this->setConfigDir(__DIR__ . "./configs/");
    }
}
