<?
$PHP_Path=GetEnv('PHP_Path')?: 'C:\SRV\Script\PHP\V8x4'; //TODO: Detect

$PhpConfig=[
  'extension_dir'=>$PHP_Path.'\ext',
];

$Options['Mem']='1512M';
$Options['Jit']=Null;
$OptsInfo=[
  ...NormalizeOptsInfo(Include 'PHP/Opt/All.php'),
  ...$OptsInfo,
];
