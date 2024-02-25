<?php

require 'vendor/autoload.php';

class Template extends Smarty
{
    function __construct()
    {
        parent::__construct();
        $this->setTemplateDir('templates/');
        $this->setCacheDir("cache/");
        $this->setCompileDir("templates_c/");
        $this->setConfigDir("configs/");
    }
}
