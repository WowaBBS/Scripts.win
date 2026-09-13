<?
$PHP_Path=GetEnv('PHP_Path')?: 'C:\SRV\Script\PHP\V8x4'; //TODO: Detect

$PhpConfig=[
  'extension_dir'=>$PHP_Path.'\ext',
];

$OptsInfo=[
  ...NormalizeOptsInfo(Include __DIR__.'/Opt/All.php'),
  ...$OptsInfo,
];
