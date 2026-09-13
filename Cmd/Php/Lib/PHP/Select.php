<?
$PHP_Path=GetEnv('PHP_Path')?: DirName(PHP_BINARY); //TODO: Detect

$PhpConfig=[
  'extension_dir'=>$PHP_Path.'\ext',
];

$OptsInfo=[
  ...NormalizeOptsInfo(Include 'Opt/All.php'),
  ...$OptsInfo,
];

Function PHP_MakeArgs()
{
  Global $PhpConfig;
  Global $Args;
  
  ForEach($PhpConfig As $k=>$v)
  {
    If(Is_String($v)) Array_Push($Args, '-d', $k.'='.$v); Else
    If(Is_Array($v)) 
      ForEach($v As $k2=>$v2)
        Array_Push($Args, '-d', $k.'.'.$k2.'='.$v2); 
  }
  
  Global $argv;
  Global $CallFile;
  Global $PHP_Path;
  
  Array_Push($Args, '-c', $PHP_Path);
  Array_Push($Args, '-f', $CallFile);
  Array_Push($Args, '--');
  Array_Push($Args, ...Array_Slice($argv, 2));
  
  Global $Ver;

  
  If(!$Ver) $Ver='84';
}