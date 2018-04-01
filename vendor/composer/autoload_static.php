<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit211839d18b0c3e24c5457707508f819b
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'Predis\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Predis\\' => 
        array (
            0 => __DIR__ . '/..' . '/predis/predis/src',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit211839d18b0c3e24c5457707508f819b::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit211839d18b0c3e24c5457707508f819b::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}